require 'rails_helper'

RSpec.describe 'routing to root path', type: :routing do
  it 'routes / to search/search_request for searching Flickr photos' do
    expect(get: '/').to route_to(controller: 'search', action: 'search_request')
  end
end
