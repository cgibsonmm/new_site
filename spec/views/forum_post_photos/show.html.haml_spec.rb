require 'rails_helper'

RSpec.describe "forum_post_photos/show", type: :view do
  before(:each) do
    @forum_post_photo = assign(:forum_post_photo, ForumPostPhoto.create!(
      :image_data => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
