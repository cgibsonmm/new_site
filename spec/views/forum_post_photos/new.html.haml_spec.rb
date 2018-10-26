require 'rails_helper'

RSpec.describe "forum_post_photos/new", type: :view do
  before(:each) do
    assign(:forum_post_photo, ForumPostPhoto.new(
      :image_data => "MyText",
      :user => nil
    ))
  end

  it "renders new forum_post_photo form" do
    render

    assert_select "form[action=?][method=?]", forum_post_photos_path, "post" do

      assert_select "textarea[name=?]", "forum_post_photo[image_data]"

      assert_select "input[name=?]", "forum_post_photo[user_id]"
    end
  end
end
