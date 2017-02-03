# encoding: utf-8

class SearchController < ApplicationController
  before_action :initialize_api

  def search_request; end # A method to handle search requests.

  def search_response # A method to handle search responses.
    # Possible parameters:
    # text: Text search in title, gallery and some other fields.
    # tags: A comma-delimited list of tags. Maximum 20.
    # min_upload_date: 2004-11-29 16:01:26
    # max_upload_date: 2004-11-29 16:01:26
    # safe_search: 1- safe, 2- moderate, 3- restricted
    # has_geo: 0- false, 1- true
    # geo_context: 0- not defined, 1- indoors, 2- outdoors

    query = params["search"]
    response = @flickr_api.search_photos(
      text: query["text"],
      tags: query["tags"],
      min_upload_date: query["min_upload_date"],
      max_upload_date: query["max_upload_date"],
      safe_search: query["safe_search"],
      has_geo: query["has_geo"],
      geo_context: query["geo_context"]
    ).body

    @photos = JSON.parse(response)

    # unless @photos["stat"] == "ok" redirect_to root_path, alert "foobar!"


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
    @flickr_api = FlickrAPI.new(ENV['flickr_api_key'])
  end
end
