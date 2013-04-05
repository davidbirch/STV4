require 'spec_helper'

describe RegionsController do
  
  include AuthHelper
  
  describe "GET #index (unauthenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      get :index
    end
    
    it "should return a 401 with no basic auth" do
      response.status.should == 401
    end
  end

  describe "GET #index (unauthenticated via http)" do
    before :each do
      get :index
    end
    
    it "should return a 301 redirect to the https site" do
      response.status.should == 301
    end
  end
  
  describe "GET #index (authenticated via http)" do
    before :each do
      http_login
      get :index
    end
    
    it "should return a 301 redirect to the https site" do
      response.status.should == 301
    end
  end
  
  describe "GET #index (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @region = FactoryGirl.create(:region)
      get :index
    end
    
    it "should return a 200 with valid basic auth" do
      response.status.should == 200
    end
    
    it "populates an array of regions" do
      assigns(:regions).should eq([@region])
    end
    
    it "renders the :index view" do
      response.should render_template :index
    end
  end
  
  describe "GET #show (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @region = FactoryGirl.create(:region)
      get :show, id: @region
    end
        
    it "assigns the requested region to @region" do
      assigns(:region).should eq(@region)
    end
        
    it "renders the :show template" do
      response.should render_template :show
    end
  end
  
  describe "GET #edit (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @region = FactoryGirl.create(:region)
      get :edit, id: @region
    end
        
    it "assigns the requested region to @region" do
      assigns(:region).should eq(@region)
    end
        
    it "renders the :edit template" do
      response.should render_template :edit
    end
  end
  
  describe "GET #new (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      get :new
    end
      
    it "assigns a new Region as @region" do
      assigns(:region).should be_a_new(Region)
    end
    
    it "renders the :new template" do
      response.should render_template :new
    end
    
  end
  
  describe "POST #create (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
    end
    
    context "with valid attributes" do
      it "creates a new region" do
        expect{
        post :create, region: FactoryGirl.attributes_for(:region)
        }.to change(Region,:count).by(1)
      end
            
      it "redirects to the new region" do
        post :create, region: FactoryGirl.attributes_for(:region)
        response.should redirect_to Region.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new region" do
        expect{
        post :create, region: FactoryGirl.attributes_for(:invalid_region)
        }.to_not change(Region,:count)
      end
      
      it "re-renders the new method" do
        post :create, region: FactoryGirl.attributes_for(:invalid_region)
        response.should render_template :new
      end 
    end
  end
  
  describe 'PUT #update (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @region = FactoryGirl.create(:region)
    end
  
    context "valid attributes" do
      it "located the requested @region" do
        put :update, id: @region, region: FactoryGirl.attributes_for(:region)
        assigns(:region).should eq(@region)      
      end
    
      it "changes @regions's attributes" do
        put :update, id: @region, region: FactoryGirl.attributes_for(:region, name: "Sydney")
        @region.reload
        @region.name.should eq("Sydney")
      end
    
      it "redirects to the updated region" do
        put :update, id: @region, region: FactoryGirl.attributes_for(:region)
        response.should redirect_to @region
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @region" do
        put :update, id: @region, region: FactoryGirl.attributes_for(:invalid_region)
        assigns(:region).should eq(@region)      
      end
      
      it "does not change @region's attributes" do
        put :update, id: @region, region: FactoryGirl.attributes_for(:region, name: nil)
        @region.reload
        @region.name.should_not eq("")
      end
      
      it "re-renders the edit method" do
        put :update, id: @region, region: FactoryGirl.attributes_for(:invalid_region)
        response.should render_template :edit
      end
    end
  end
    
  describe 'DELETE #destroy (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @region = FactoryGirl.create(:region)
    end
    
    it "deletes the region" do
      expect{
        delete :destroy, id: @region        
      }.to change(Region,:count).by(-1)
    end
      
    it "redirects to regions#index" do
      delete :destroy, id: @region
      response.should redirect_to regions_url
    end
  end
  
end  