# encoding: utf-8

class SearchController < ApplicationController
  before_action :initialize_api

  def search_request; end # A method to handle search requests.

  def search_response # A method to handle search responses.
    # Possible parameters:
    # tags: A comma-delimited list of tags. Maximum 20.
    # min_upload_date: TODO
    # max_upload_date: TODO
    # safe_search: 1- safe, 2- moderate, 3- restricted
    # has_geo: 0- false, 1- true
    # geo_context: 0- not defined, 1- indoors, 2- outdoors
    response = @flickr_api.search_photos(text: params[:search][:text]).body
    @photos = JSONParser.new(response).parse_flickr_json
  rescue RestClient::ExceptionWithResponse => err
    case err.http_code
    when 301, 302, 307
      err.response.follow_redirection
    else
      raise
    end
  end

  private

  def initialize_api
    # @flickr_api = FlickrAPI.new(ENV['flickr_api_key'])
    @flickr_api = FlickrAPI.new("aaa")
  end
end

# @flickr.get_exif({ photo_id: "id_of_the_photo" })
