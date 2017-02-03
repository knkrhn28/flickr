# encoding: utf-8

module SearchHelper
  # used by search_request template and passed to lib/flickr_api.rb
  def safe_search_options
    [
      %w(Safe 1),
      %w(Moderate 2),
      %w(Restricted 3)
    ]
  end

  # used by search_request template and passed to lib/flickr_api.rb
  def geo_context_options
    [
      %w(Not Defined 1),
      %w(Indoors 2),
      %w(Outdoors 3)
    ]
  end
end
