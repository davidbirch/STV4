require "spec_helper"

describe RawProgramsController do
  describe "routing" do

    it "routes to #index" do
      get("/raw_programs").should route_to("raw_programs#index")
    end

    it "routes to #new" do
      get("/raw_programs/new").should route_to("raw_programs#new")
    end

    it "routes to #show" do
      get("/raw_programs/1").should route_to("raw_programs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/raw_programs/1/edit").should route_to("raw_programs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/raw_programs").should route_to("raw_programs#create")
    end

    it "routes to #update" do
      put("/raw_programs/1").should route_to("raw_programs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/raw_programs/1").should route_to("raw_programs#destroy", :id => "1")
    end

  end
end
