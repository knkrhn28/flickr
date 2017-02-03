# encoding: utf-8

class SearchController < ApplicationController
  before_action :initialize_api

  def search_request; end # A method to handle search requests.

  def search_response # A method to handle search responses.
    # short-cut for query params
    q = params["search"]

    # performs an API call with sanitized parameters. Renders :search_request for nil text param.
    if sanitize_text(q["text"]).present?
      @sanitized_params = {
        # text: Text search in title, gallery and some other fields.
        text: sanitize_text(q["text"]),
        # tags: A comma-delimited list of tags. Maximum 20.
        tags: sanitize_tags(q["tags"]),
        # min_upload_date: 2004-11-29 16:01:26
        min_upload_date: sanitize_date(
          q["min_upload_date(3i)"], q["min_upload_date(2i)"], q["min_upload_date(1i)"]
        ),
        # max_upload_date: 2004-11-29 16:01:26
        max_upload_date: sanitize_date(
          q["max_upload_date(3i)"], q["max_upload_date(2i)"], q["max_upload_date(1i)"]
        ),
        # has_geo: 0- false, 1- true
        has_geo: sanitize_has_geo(q["has_geo"]),
        # geo_context: 0- not defined, 1- indoors, 2- outdoors
        geo_context: sanitize_geo_context(q["geo_context"])
      }
      response = @flickr_api.search_photos(@sanitized_params).body
      @photos = JSON.parse(response)
      check_api_response(@photos["photos"]["total"], @photos["stat"])
    else
      flash.now[:error] = "You have to write something to search!"
      render action: "search_request"
    end

  rescue RestClient::ExceptionWithResponse => err
    case err.http_code
    when 301, 302, 307
      err.response.follow_redirection
    else
      raise
    end
  end

  private

  def check_api_response(total, stat)
    if total.to_i < 1
      flash[:notice] = "No results found. Try another request."
      render action: "search_request"
    elsif stat == "fail"
      flash[:error] = "We are having an issue with FlickrAPI. Please try again later."
      render action: "search_request"
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
      (tags =~ /^([a-z]+)(,\s*[a-z]+)*$/i).present? ? tags.tr(' ', '').split(',') : ""
    else
      ""
    end
  end

  def sanitize_date(d, m, y)
    # Join date, month and year params and convert them to API format
    if d.present? && m.present? && y.present?
      "#{d}.#{m}.#{y}".to_date.strftime('%Y-%m-%d %H:%M:%S')
    else
      ""
    end
  end

  def sanitize_has_geo(geo_param)
    # Check for unexpected values posted!
    ["0", "1"].include?(geo_param) ? geo_param : ""
  end

  def sanitize_geo_context(geo_context_param)
    # Check for unexpected values posted!
    ["1", "2", "3"].include?(geo_context_param) ? geo_context_param : ""
  end

  def initialize_api
    @flickr_api = FlickrAPI.new(ENV['flickr_api_key'])
  end
end
