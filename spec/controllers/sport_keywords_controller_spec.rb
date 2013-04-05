require 'spec_helper'

describe SportKeywordsController do
  
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
      @sport_keyword = FactoryGirl.create(:sport_keyword)
      get :index
    end
    
    it "should return a 200 with valid basic auth" do
      response.status.should == 200
    end
    
    it "populates an array of sport_keywords" do
      assigns(:sport_keywords).should eq([@sport_keyword])
    end
    
    it "renders the :index view" do
      response.should render_template :index
    end
  end
  
  describe "GET #show (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport_keyword = FactoryGirl.create(:sport_keyword)
      get :show, id: @sport_keyword
    end
        
    it "assigns the requested sport_keyword to @sport_keyword" do
      assigns(:sport_keyword).should eq(@sport_keyword)
    end
        
    it "renders the :show template" do
      response.should render_template :show
    end
  end
  
  describe "GET #edit (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport_keyword = FactoryGirl.create(:sport_keyword)
      get :edit, id: @sport_keyword
    end
        
    it "assigns the requested sport_keyword to @sport_keyword" do
      assigns(:sport_keyword).should eq(@sport_keyword)
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
      
    it "assigns a new SportKeyword as @sport_keyword" do
      assigns(:sport_keyword).should be_a_new(SportKeyword)
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
      it "creates a new sport_keyword" do
        expect{
        post :create, sport_keyword: FactoryGirl.attributes_for(:sport_keyword)
        }.to change(SportKeyword,:count).by(1)
      end
            
      it "redirects to the new sport_keyword" do
        post :create, sport_keyword: FactoryGirl.attributes_for(:sport_keyword)
        response.should redirect_to SportKeyword.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new sportkeyword" do
        expect{
        post :create, sportkeyword: FactoryGirl.attributes_for(:invalid_sport_keyword)
        }.to_not change(SportKeyword,:count)
      end
      
      it "re-renders the new method" do
        post :create, sport_keyword: FactoryGirl.attributes_for(:invalid_sport_keyword)
        response.should render_template :new
      end 
    end
  end
  
  describe 'PUT #update (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport_keyword = FactoryGirl.create(:sport_keyword)
    end
  
    context "valid attributes" do
      it "located the requested @sport_keyword" do
        put :update, id: @sport_keyword, sport_keyword: FactoryGirl.attributes_for(:sport_keyword)
        assigns(:sport_keyword).should eq(@sport_keyword)      
      end
    
      it "changes @sport_keywords's attributes" do
        put :update, id: @sport_keyword, sport_keyword: FactoryGirl.attributes_for(:sport_keyword, value: "A Sport Name")
        @sport_keyword.reload
        @sport_keyword.value.should eq("A Sport Name")
      end
    
      it "redirects to the updated sport_keyword" do
        put :update, id: @sport_keyword, sport_keyword: FactoryGirl.attributes_for(:sport_keyword)
        response.should redirect_to @sport_keyword
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @sport_keyword" do
        put :update, id: @sport_keyword, sport_keyword: FactoryGirl.attributes_for(:invalid_sport_keyword)
        assigns(:sport_keyword).should eq(@sport_keyword)      
      end
      
      it "does not change @sport_keyword's attributes" do
        put :update, id: @sport_keyword, sport_keyword: FactoryGirl.attributes_for(:sport_keyword, value: nil)
        @sport_keyword.reload
        @sport_keyword.value.should_not eq("")
      end
      
      it "re-renders the edit method" do
        put :update, id: @sport_keyword, sport_keyword: FactoryGirl.attributes_for(:invalid_sport_keyword)
        response.should render_template :edit
      end
    end
  end
    
  describe 'DELETE #destroy (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @sport_keyword = FactoryGirl.create(:sport_keyword)
    end
    
    it "deletes the sport_keyword" do
      expect{
        delete :destroy, id: @sport_keyword        
      }.to change(SportKeyword,:count).by(-1)
    end
      
    it "redirects to sport_keywords#index" do
      delete :destroy, id: @sport_keyword
      response.should redirect_to sport_keywords_url
    end
  end
  
end  