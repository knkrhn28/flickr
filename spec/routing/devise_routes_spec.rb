require 'rails_helper'

RSpec.describe 'routing to devise paths', type: :routing do
  it 'routes /login to devise/sessions#new for login' do
    expect(get: '/login').to route_to(controller: 'devise/sessions', action: 'new')
  end

  it 'routes /register to devise/registrations#new for registration' do
    expect(get: '/register').to route_to(controller: 'devise/registrations', action: 'new')
  end

  it 'routes /recover to devise/passwords#new for forgotten passwords' do
    expect(get: '/recover').to route_to(controller: 'devise/passwords', action: 'new')
  end

  it 'routes /update to devise/registrations#edit for profile editing' do
    expect(get: '/update').to route_to(controller: 'devise/registrations', action: 'edit')
  end

  it 'routes /logout to devise/sessions#destroy for logout' do
    expect(get: '/logout').to route_to(controller: 'devise/sessions', action: 'destroy')
  end
end
