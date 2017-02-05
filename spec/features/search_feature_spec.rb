require 'rails_helper'

RSpec.feature 'Flickr API search process', type: :feature do
  scenario 'Successful search with text parameter' do
    visit '/'

    within('.search_text') do
      fill_in 'search_text', with: 'Ankara'
    end

    within('#collapseExample') do
      click_button 'Search'
    end
    expect(page).to have_content 'results found'
  end

  scenario 'Unsuccessful search without text parameter' do
    visit '/'

    within('.search_text') do
      fill_in 'search_text', with: ''
    end

    within('#collapseExample') do
      click_button 'Search'
    end
    expect(page).to have_content 'Advanced Search'
  end
end
