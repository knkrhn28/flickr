require 'rails_helper'

RSpec.describe 'Test requests on devise routes', type: :request do
  it '/update redirects_to login_path' do
    get update_path
    expect(response).to redirect_to(new_user_session_path)
  end

  it '/logout redirects_to root_path' do
    get logout_path
    expect(response).to redirect_to(root_path)
  end
end
