# Custom module to communicate with Flickr API.

class FlickrAPI
  require 'rest-client'
  # A custom class used to communicate with Flickr API.
  # No authentication features currently enabled, see documentation below to enable.
  # https://github.com/rest-client/rest-client#hook

  def initialize(api_key, response_format = 'json', max_redirects = 5, timeout = 10)
    # max_redirects: maximum number of HTTP 30x redirection requests.
    # timeout: Timeout duration, in seconds.
    # format: json, rest, xmlrpc and soap are possible response formats.

    @resource = RestClient::Resource.new('https://api.flickr.com/services/rest')
    @params = {
      api_key: api_key,
      format: response_format,
      max_redirects: max_redirects,
      timeout: timeout,
      nojsoncallback: '1' # to get rid of JSONp
    }
  end

  # Call these methods anywhere after initializing the rest-client.
  # some_variable = FlickrAPI.new(ENV['flickr_api_key'])
  # Then call the methods by their name: search_photos({ params })
  def search_photos(options = {})
    # Searches public photos with flickr.photos.search method.
    api_method = { method: 'flickr.photos.search' }
    api_call(@params, api_method, options)
  end

  def get_exif(options = {})
    # Retrieves a list of EXIF/TIFF/GPS tags for a given photo.
    api_method = { method: 'flickr.photos.getExif' }
    api_call(@params, api_method, options)
  end

  def get_geolocation(options = {})
    # Get the geo data (lat. and long. and the accuracy level) for a photo.
    api_method = { method: 'flickr.photos.geo.getLocation' }
    api_call(@params, api_method, options)
  end

  def api_call(params, api_method, options)
    # Performs an HTTP request to the API.
    query = [params, api_method, options].inject(&:merge)
    @resource.get(params: query)
  end
end