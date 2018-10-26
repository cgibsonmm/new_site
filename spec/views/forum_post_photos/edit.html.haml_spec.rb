require 'rails_helper'

RSpec.describe "forum_post_photos/edit", type: :view do
  before(:each) do
    @forum_post_photo = assign(:forum_post_photo, ForumPostPhoto.create!(
      :image_data => "MyText",
      :user => nil
    ))
  end

  it "renders the edit forum_post_photo form" do
    render

    assert_select "form[action=?][method=?]", forum_post_photo_path(@forum_post_photo), "post" do

      assert_select "textarea[name=?]", "forum_post_photo[image_data]"

      assert_select "input[name=?]", "forum_post_photo[user_id]"
    end
  end
end
