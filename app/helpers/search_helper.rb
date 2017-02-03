# encoding: utf-8

module SearchHelper
  # used by search_request template and passed to lib/flickr_api.rb
  def safe_search_options
    [
      ["Safe","1"],
      ["Moderate","2"],
      ["Restricted","3"]
    ]
  end

  def geo_context_options
    [
      ["Not Defined","1"],
      ["Indoors","2"],
      ["Outdoors","3"]
    ]
  end
end


