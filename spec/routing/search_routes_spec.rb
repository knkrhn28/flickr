require 'rails_helper'

RSpec.describe 'routing to search paths', type: :routing do
  it 'routes /search to search/search_request for searching Flickr photos' do
    expect(get: '/search').to route_to(controller: 'search', action: 'search_request')
  end

  it 'routes /results to search/search_response for returning Flickr photos' do
    expect(get: '/results').to route_to(controller: 'search', action: 'search_response')
  end
end
