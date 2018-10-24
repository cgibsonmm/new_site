require 'rails_helper'

RSpec.feature 'User creates new forum thread' do
  before do
    @user = create(:user)
  end

  context 'Signed in user' do
    before do
      sign_in_with(@user)
      click_link 'Forum'
    end

    scenario 'can create a new forum thread' do
      expect(page).to have_content 'Sprout Free Forum'
      click_link 'New Thread'

      fill_in("Title", with: 'This is a subject')
      fill_in("Post", with: 'This is a test body')
      click_button 'Post New Thread'

      expect(page).to have_content('Successfully created a new thread')
      expect(page).to have_content('This is a subject')
      expect(page).to have_content('This is a test body')
    end

    scenario 'forum thread must have a title' do
      click_link 'New Thread'

      fill_in("Title", with: '')
      fill_in("Post", with: 'This is a test body')
      click_button 'Post New Thread'

      expect(page).to have_content("Subject can't be blank")
    end

    scenario 'forum thread title must be greater than 3 chars' do
      click_link 'New Thread'

      fill_in("Title", with: '!')
      fill_in("Post", with: 'This is a test body')
      click_button 'Post New Thread'

      expect(page).to have_content("Subject is too short")
    end

    scenario 'forum thread title can not be greater than 50 chars' do
      click_link 'New Thread'

      fill_in("Title", with: '!' * 51)
      fill_in("Post", with: 'This is a test body')
      click_button 'Post New Thread'

      expect(page).to have_content("Subject is too long")
    end

    scenario 'forum thread must have a body' do
      click_link 'New Thread'

      fill_in("Title", with: 'This is a test title')
      fill_in("Post", with: '')
      click_button 'Post New Thread'

      expect(page).to have_content("Body can't be blank")
    end

    # Rest of validation housed in Creating ForumPost Spec
  end

  context 'No user signed in' do
    before do
      visit '/'
      expect(page).to have_content('Sign in')
    end
    scenario 'User must be signed in to create a forum thread' do
      click_link 'Forum'
      click_link 'New Thread'

      expect(page).to have_content('You need to sign in or sign up before continuing')

      visit '/forum_threads/new'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end
