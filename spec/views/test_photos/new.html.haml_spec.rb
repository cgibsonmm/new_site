require 'rails_helper'

RSpec.describe "test_photos/new", type: :view do
  before(:each) do
    assign(:test_photo, TestPhoto.new(
      :image_data => "MyText"
    ))
  end

  it "renders new test_photo form" do
    render

    assert_select "form[action=?][method=?]", test_photos_path, "post" do

      assert_select "textarea[name=?]", "test_photo[image_data]"
    end
  end
end
