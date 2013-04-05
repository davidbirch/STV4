require 'spec_helper'

describe GuideController do
  
  include AuthHelper 
  
  describe "GET #show" do
    before :each do
      get :show, region_name: "Melbourne"
    end
    
    it "redirects to the 404 page because the region is invalid" do
      response.status.should == 404
    end  
  end
  
  describe "GET #index" do
    before :each do
      get :index
    end
    
    it "renders the :index view" do
      response.should render_template :index
    end  
  end  
  
end
  