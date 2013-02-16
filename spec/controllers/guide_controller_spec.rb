require "spec_helper"

describe GuideController do

  describe "GET index" do
    before :each do
      get :index
    end
    
    it "assigns all regions as @regions" do
      assigns(:regions).count.should be > 0
    end
    
    it "assigns a page @title" do
      assigns(:title).should_not be_nil
    end
    
    it "assigns a page @meta_keywords" do
      assigns(:meta_keywords).should_not be_nil
    end
   
    it "assigns a page @meta_description" do
      assigns(:meta_description).should_not be_nil
    end 
    
    it "renders the :index view" do
      response.should render_template :index
    end  
  end

  describe "GET show" do
      before :each do
        @region = FactoryGirl.create(:region)
        @sport = FactoryGirl.create(:sport)
        
        get :show, {region_name: @region.name, sport_name: @sport.name}
      end
      
      it "redirects to 404 error for an invalide region"
        
      
      it "redirects to 404 error for an invalid sport"
      
      
      it "assigns the requested region as @region" do
        assigns(:region).should eq(@region)
      end
      
      it "assigns the requested sport as @sport" do
        assigns(:sport).should eq(@sport)
      end
      
      it "assigns the programs as @programs"
            
      it "assigns all regions as @regions" do
        assigns(:regions).count.should be > 0
      end
      
      it "assigns a page @title" do
        assigns(:title).should_not be_nil
      end
      
      it "assigns a page @meta_keywords" do
        assigns(:meta_keywords).should_not be_nil
      end
     
      it "assigns a page @meta_description" do
        assigns(:meta_description).should_not be_nil
      end 
      it "renders the :show view" do
        response.should render_template :show
      end  
  end
  
end
