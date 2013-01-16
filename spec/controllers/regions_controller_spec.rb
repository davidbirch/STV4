require "spec_helper"

describe RegionsController do

  describe "GET index" do
    before :each do
      get :index
    end
    it "assigns all regions as @regions" do
      assigns(:regions).count.should be > 0
    end
    it "renders the :index view" do
      response.should render_template :index
    end  
  end

  describe "GET show" do
    
    before :each do
      @region = FactoryGirl.create(:region)
      get :show, id: @region
    end 
    it "assigns the requested region as @region" do
      assigns(:region).should eq(@region)
    end
    it "renders the :show template" do
      response.should render_template :show
    end
  end
  
end
