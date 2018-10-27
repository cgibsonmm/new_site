require 'rails_helper'

RSpec.describe "test_photos/show", type: :view do
  before(:each) do
    @test_photo = assign(:test_photo, TestPhoto.create!(
      :image_data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
