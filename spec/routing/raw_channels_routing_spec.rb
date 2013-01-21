require "spec_helper"

describe RawChannelsController do
  describe "routing" do

    it "routes to #index" do
      get("/raw_channels").should route_to("raw_channels#index")
    end

    it "routes to #new" do
      get("/raw_channels/new").should route_to("raw_channels#new")
    end

    it "routes to #show" do
      get("/raw_channels/1").should route_to("raw_channels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/raw_channels/1/edit").should route_to("raw_channels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/raw_channels").should route_to("raw_channels#create")
    end

    it "routes to #update" do
      put("/raw_channels/1").should route_to("raw_channels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/raw_channels/1").should route_to("raw_channels#destroy", :id => "1")
    end

  end
end
