require 'spec_helper'

describe SportsController do
  
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
      @sport = FactoryGirl.create(:sport)
      get :index
    end
    
    it "should return a 200 with valid basic auth" do
      response.status.should == 200
    end
    
    it "populates an array of sports" do
      assigns(:sports).should eq([@sport])
    end
    
    it "renders the :index view" do
      response.should render_template :index
    end
  end
  
  describe "GET #show (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport = FactoryGirl.create(:sport)
      get :show, id: @sport
    end
        
    it "assigns the requested sport to @sport" do
      assigns(:sport).should eq(@sport)
    end
        
    it "renders the :show template" do
      response.should render_template :show
    end
  end
  
  describe "GET #edit (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport = FactoryGirl.create(:sport)
      get :edit, id: @sport
    end
        
    it "assigns the requested sport to @sport" do
      assigns(:sport).should eq(@sport)
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
      
    it "assigns a new Sport as @sport" do
      assigns(:sport).should be_a_new(Sport)
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
      it "creates a new sport" do
        expect{
        post :create, sport: FactoryGirl.attributes_for(:sport)
        }.to change(Sport,:count).by(1)
      end
            
      it "redirects to the new sport" do
        post :create, sport: FactoryGirl.attributes_for(:sport)
        response.should redirect_to Sport.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new sport" do
        expect{
        post :create, sport: FactoryGirl.attributes_for(:invalid_sport)
        }.to_not change(Sport,:count)
      end
      
      it "re-renders the new method" do
        post :create, sport: FactoryGirl.attributes_for(:invalid_sport)
        response.should render_template :new
      end 
    end
  end
  
  describe 'PUT #update (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport = FactoryGirl.create(:sport)
    end
  
    context "valid attributes" do
      it "located the requested @sport" do
        put :update, id: @sport, sport: FactoryGirl.attributes_for(:sport)
        assigns(:sport).should eq(@sport)      
      end
    
      it "changes @sports's attributes" do
        put :update, id: @sport, sport: FactoryGirl.attributes_for(:sport, name: "Squash")
        @sport.reload
        @sport.name.should eq("Squash")
      end
    
      it "redirects to the updated sport" do
        put :update, id: @sport, sport: FactoryGirl.attributes_for(:sport)
        response.should redirect_to @sport
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @sport" do
        put :update, id: @sport, sport: FactoryGirl.attributes_for(:invalid_sport)
        assigns(:sport).should eq(@sport)      
      end
      
      it "does not change @sport's attributes" do
        put :update, id: @sport, sport: FactoryGirl.attributes_for(:sport, name: nil)
        @sport.reload
        @sport.name.should_not eq("")
      end
      
      it "re-renders the edit method" do
        put :update, id: @sport, sport: FactoryGirl.attributes_for(:invalid_sport)
        response.should render_template :edit
      end
    end
  end
    
  describe 'DELETE #destroy (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport = FactoryGirl.create(:sport)
    end
    
    it "deletes the sport" do
      expect{
        delete :destroy, id: @sport        
      }.to change(Sport,:count).by(-1)
    end
      
    it "redirects to sports#index" do
      delete :destroy, id: @sport
      response.should redirect_to sports_url
    end
  end
  
end  