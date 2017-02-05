require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #search_request' do
    it 'responds successfully with an HTTP 200 status code' do
      get :search_request
      expect(response).to eq(200)
    end

    it 'renders the search_request template' do
      get :search_request
      expect(response).to render_template('search/search_request')
    end
  end
end
