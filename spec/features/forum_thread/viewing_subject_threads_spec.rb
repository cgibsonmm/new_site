require 'rails_helper'

RSpec.feature 'viewing all threads under a subject' do
  before do
    @user = create(:user)
    @subject = create(:forum_subject)
    @thread = create(:forum_thread)
  end
end
