# encoding: utf-8

class SearchController < ApplicationController
  before_action :initialize_api
  before_action :check_params, only: :search_response
  before_action :sanitize_parameters, only: :search_response, if: :check_params

  def search_request; end # Handles search requests.

  def search_response
    # Handles search responses. Performs an API call with sanitized parameters.

    # Search photos from API and parse returned JSON
    response_json = JSON.parse(@flickr_api.search_photos(sanitize_parameters).body)

    # Check API 'stat' parameter for empty responses or failures
    check_api_response(response_json['photos']['total'], response_json['stat'])

    # Return a list of photos for url generation
    photos = response_json['photos']['photo']

    # Generate an array of hashes with URLs and picture titles
    generate_photo_urls(photos, 'm')

  rescue RestClient::ExceptionWithResponse => err
    case err.http_code
    when 301, 302, 307
      err.response.follow_redirection
    else
      raise
    end
  end

  private

  def generate_photo_urls(photos_hash, size)
    # generate URLs for horrible Flickr API
    @hash_with_url = []
    photos_hash.each do |photo|
      hash_params = {
        title: photo['title'],
        picture_url: "https://farm#{photo['farm']}.staticflickr."\
        "com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_#{size}.jpg"
      }
      @hash_with_url << hash_params
    end
    paginate_array(@hash_with_url)
  end

  def paginate_array(arr)
    @hash_with_url = Kaminari.paginate_array(arr).page(params[:page]).per(10)
  end

  def check_api_response(total, stat)
    # Check API response for empty responses or failures
    if total.to_i < 1
      flash[:notice] = 'No results found. Try another request.'
      render action: 'search_request'
    elsif stat == 'fail'
      flash[:error] = 'We are having an issue with FlickrAPI. Please try again later.'
      render action: 'search_request'
    end
  end

  def sanitize_text(text_param)
    # Remove all special characters from the search query
    text_param.strip.tap do |name|
      name.gsub(/[^0-9A-Za-z ]/, '')
    end
  end

  def sanitize_tags(tags)
    # Sanitize tags and look for comma-separated string, otherwise return an empty string
    if tags.present?
      (tags =~ /^([a-z]+)(,\s*[a-z]+)*$/i).present? ? tags.tr(' ', '').split(',') : ''
    else
      ''
    end
  end

  def sanitize_date(d, m, y)
    # Join date, month and year params and convert them to API format
    if d.present? && m.present? && y.present?
      "#{d}.#{m}.#{y}".to_date.strftime('%Y-%m-%d %H:%M:%S')
    else
      ''
    end
  end

  def sanitize_has_geo(geo_param)
    # Check for unexpected values posted!
    %w(0 1).include?(geo_param) ? geo_param : ''
  end

  def sanitize_geo_context(geo_context_param)
    # Check for unexpected values posted!
    %w(1 2 3).include?(geo_context_param) ? geo_context_param : ''
  end

  def sanitize_parameters
    @sanitized_params = {
      text: sanitize_text(@q['text']), # Searches in title, description and tags
      tags: sanitize_tags(@q['tags']), # A comma-delimited list of tags. Maximum 20.
      min_upload_date: sanitize_date( # 2004-11-29 16:01:26
        @q['min_upload_date(3i)'], @q['min_upload_date(2i)'], @q['min_upload_date(1i)']
      ),
      max_upload_date: sanitize_date( # 2004-11-29 16:01:26
        @q['max_upload_date(3i)'], @q['max_upload_date(2i)'], @q['max_upload_date(1i)']
      ),
      has_geo: sanitize_has_geo(@q['has_geo']), # 0- false, 1- true
      geo_context: sanitize_geo_context(@q['geo_context']) # 0- not defined, 1- indoors, 2- outdoors
    }
  end

  def check_params
    # Checks if 'text' parameter exists before calling the API
    @q = params['search']
    return true if sanitize_text(@q['text']).present?
    flash[:error] = 'You have to write something to search!'
    render action: 'search_request'
  end

  def initialize_api
    # Initialize FlickrAPI
    @flickr_api = FlickrAPI.new(ENV['flickr_api_key'])
  end
end
