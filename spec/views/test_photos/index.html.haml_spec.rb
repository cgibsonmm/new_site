require 'rails_helper'

RSpec.describe "test_photos/index", type: :view do
  before(:each) do
    assign(:test_photos, [
      TestPhoto.create!(
        :image_data => "MyText"
      ),
      TestPhoto.create!(
        :image_data => "MyText"
      )
    ])
  end

  it "renders a list of test_photos" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
