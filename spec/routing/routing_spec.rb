require "spec_helper"

describe RegionsController do
  
  describe "routing" do

    it "routes to #index" do
      get("/regions").should route_to("regions#index")
    end

    it "routes to #show" do
      get("/regions/1").should route_to("regions#show", :id => "1")
    end
    
  end
  
end
