require 'rails_helper'

RSpec.feature 'User sign up' do
  before do
    visit '/'
  end

  scenario 'website visitor can sign up for an account' do
    click_button 'Sign up'

    fill_in('Username', with: 'test_user1')
    fill_in('Password', with: 'testpassword123')
    fill_in(:password_digest, with: 'testpassword123')
    click_link 'Submit'

    expect(page).to have_content('Successfully signed up!')
    expect(page).to have_content('Sign out')
    expect(page).to have_css('.user-name', text: 'test_user1')
    expect(page).not_to have_content('Sign in')
    expect(page).not_to have_content('Sign up')
  end
end
