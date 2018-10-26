require 'rails_helper'

RSpec.describe "forum_post_photos/index", type: :view do
  before(:each) do
    assign(:forum_post_photos, [
      ForumPostPhoto.create!(
        :image_data => "MyText",
        :user => nil
      ),
      ForumPostPhoto.create!(
        :image_data => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of forum_post_photos" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
