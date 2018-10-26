require "rails_helper"

RSpec.describe ForumPostPhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/forum_post_photos").to route_to("forum_post_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/forum_post_photos/new").to route_to("forum_post_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/forum_post_photos/1").to route_to("forum_post_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/forum_post_photos/1/edit").to route_to("forum_post_photos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/forum_post_photos").to route_to("forum_post_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/forum_post_photos/1").to route_to("forum_post_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/forum_post_photos/1").to route_to("forum_post_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/forum_post_photos/1").to route_to("forum_post_photos#destroy", :id => "1")
    end
  end
end
