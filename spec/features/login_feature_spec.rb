require 'rails_helper'

RSpec.feature 'The login process', type: :feature do
  given(:user) { User.create!(email: 'f@o.com', date_of_birth: DateTime.now, password: 'sample') }

  scenario 'Successful login with valid parameters' do
    visit '/login'
    within('.form-inputs') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log In'
    expect(page).to have_content 'Account'
  end

  scenario 'Failed login with invalid parameters' do
    visit '/login'
    within('.form-inputs') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'invalid'
    end
    click_button 'Log In'
    expect(page).to have_content 'Forgot your password?'
  end
end
