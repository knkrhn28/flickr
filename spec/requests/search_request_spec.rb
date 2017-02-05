require 'rails_helper'

RSpec.describe 'Request search routes', type: :request do
  it 'responds with an HTTP 200 (success) status code' do
    get '/search'
    expect(response.status).to eq(200)
  end

  it 'responds with an HTTP 302 status code when called without parameters' do
    get '/results'
    expect(response.status).to eq(302)
    expect(response).to redirect_to(root_path)
  end

  it 'responds with an HTTP 200 status code when called with text parameter' do
    get '/results?search[text]=sample'
    expect(response.status).to eq(200)
  end
end
