# encoding: utf-8

class JSONParser
  def initialize(str)
    @str = str
  end

  def parse_flickr_json
    # Flickr APIs send responses in format of 'jsonFlickrApi({parameters})'
    # This method parses Flickr responses to a more meaningful value.

    # purified string without jsonFlickrApi()
    purified_string = @str.split('jsonFlickrApi({')[1].split('}')[0].delete('\\"').split(',')
    # convert string to array
    string_to_array = purified_string.map{|n| n.split(':')}
    # array to hash
    Hash[*string_to_array.flatten]
  end
end