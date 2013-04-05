require 'spec_helper'

describe ChannelsController do
  
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
      @channel = FactoryGirl.create(:channel)
      get :index
    end
    
    it "should return a 200 with valid basic auth" do
      response.status.should == 200
    end
    
    it "populates an array of channels" do
      assigns(:channels).should eq([@channel])
    end
    
    it "renders the :index view" do
      response.should render_template :index
    end
  end
  
  describe "GET #show (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @channel = FactoryGirl.create(:channel)
      get :show, id: @channel
    end
        
    it "assigns the requested channel to @channel" do
      assigns(:channel).should eq(@channel)
    end
        
    it "renders the :show template" do
      response.should render_template :show
    end
  end
  
  describe "GET #edit (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @channel = FactoryGirl.create(:channel)
      get :edit, id: @channel
    end
        
    it "assigns the requested channel to @channel" do
      assigns(:channel).should eq(@channel)
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
      
    it "assigns a new Channel as @channel" do
      assigns(:channel).should be_a_new(Channel)
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
      it "creates a new channel" do
        expect{
        post :create, channel: FactoryGirl.attributes_for(:channel)
        }.to change(Channel,:count).by(1)
      end
            
      it "redirects to the new channel" do
        post :create, channel: FactoryGirl.attributes_for(:channel)
        response.should redirect_to Channel.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new channel" do
        expect{
        post :create, channel: FactoryGirl.attributes_for(:invalid_channel)
        }.to_not change(Channel,:count)
      end
      
      it "re-renders the new method" do
        post :create, channel: FactoryGirl.attributes_for(:invalid_channel)
        response.should render_template :new
      end 
    end
  end
  
  describe 'PUT #update (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @channel = FactoryGirl.create(:channel)
    end
  
    context "valid attributes" do
      it "located the requested @channel" do
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel)
        assigns(:channel).should eq(@channel)      
      end
    
      it "changes @channels's attributes" do
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel, name: "Ten", short_name: "Ten")
        @channel.reload
        @channel.name.should eq("Ten")
        @channel.short_name.should eq("Ten")
      end
    
      it "redirects to the updated channel" do
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel)
        response.should redirect_to @channel
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @channel" do
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:invalid_channel)
        assigns(:channel).should eq(@channel)      
      end
      
      it "does not change @channel's attributes" do
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:channel, name: nil, short_name: "Ten")
        @channel.reload
        @channel.name.should_not eq("")
        @channel.short_name.should eq("Test")
      end
      
      it "re-renders the edit method" do
        put :update, id: @channel, channel: FactoryGirl.attributes_for(:invalid_channel)
        response.should render_template :edit
      end
    end
  end
  
  describe 'PUT #toggle_black_flag (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @channel = FactoryGirl.create(:channel)
    end
  
    it "located the requested @channel" do
      put :toggle_black_flag, id: @channel
      assigns(:channel).should eq(@channel)      
    end
    
    it "changes @channels's attributes" do
        put :toggle_black_flag, id: @channel
        @channel.reload
        @channel.black_flag.should be_true
    end
    
    it "redirects to the channels_url" do
        put :toggle_black_flag, id: @channel
        response.should redirect_to channels_url
    end
  end
  
  
  describe 'DELETE #destroy (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @channel = FactoryGirl.create(:channel)
    end
    
    it "deletes the channel" do
      expect{
        delete :destroy, id: @channel        
      }.to change(Channel,:count).by(-1)
    end
      
    it "redirects to channels#index" do
      delete :destroy, id: @channel
      response.should redirect_to channels_url
    end
  end
 
  
end
