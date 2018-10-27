require 'rails_helper'

RSpec.describe "test_photos/edit", type: :view do
  before(:each) do
    @test_photo = assign(:test_photo, TestPhoto.create!(
      :image_data => "MyText"
    ))
  end

  it "renders the edit test_photo form" do
    render

    assert_select "form[action=?][method=?]", test_photo_path(@test_photo), "post" do

      assert_select "textarea[name=?]", "test_photo[image_data]"
    end
  end
end
