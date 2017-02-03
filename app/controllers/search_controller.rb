# encoding: utf-8

class SearchController < ApplicationController
  before_action :initialize_api

  # A method to handle search requests.
  def search_request
  end

  # A method to handle search responses.
  def search_response
    # Possible parameters:
      # tags: A comma-delimited list of tags. Maximum 20.
      # min_upload_date: 
      # max_upload_date: 
      # safe_search: 1- safe, 2- moderate, 3- restricted
      # has_geo: 0- false, 1- true
      # geo_context: 0- not defined, 1- indoors, 2- outdoors
    begin
      @photos = @flickr_api.search_photos({ text: params[:search][:text] })
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        err.response.follow_redirection
      else
        raise
      end
    end
  end

  private

  def initialize_api
    @flickr_api = FlickrAPI.new(ENV['flickr_api_key'])
  end
end


# @flickr.get_exif({ photo_id: "id_of_the_photo" })