# encoding: utf-8

module SearchHelper
  # used by search_request template and passed to lib/flickr_api.rb
  def geo_context_options
    [
      %w(NotDefined 1),
      %w(Indoors 2),
      %w(Outdoors 3)
    ]
  end

  # used by search_request template and passed to lib/flickr_api.rb
  def has_geo_options
    [
      %w(Yes 1),
      %w(No 0)
    ]
  end
end