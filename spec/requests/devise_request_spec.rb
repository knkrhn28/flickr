require 'rails_helper'

RSpec.describe 'Test requests on devise routes', type: :request do
  it '/login responds with an HTTP 200 (success) status code' do
    get login_path
    expect(response.status).to eq(200)
  end

  it '/register responds with an HTTP 200 (success) status code' do
    get register_path
    expect(response.status).to eq(200)
  end

  it '/recover responds with an HTTP 302 (found) status code' do
    get recover_path
    expect(response.status).to eq(200)
  end

  it '/update responds with an HTTP 302 (found) status code' do
    get update_path
    expect(response.status).to eq(302)
  end

  it '/logout responds with an HTTP 302 (found) status code' do
    get logout_path
    expect(response.status).to eq(302)
  end
end
