require 'spec_helper'

describe PagesController do
  
  include AuthHelper

  describe "GET contact" do
    before :each do
      get :contact
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
    
    it "assigns a page @breadcrumb" do
      assigns(:breadcrumb).should_not be_nil
    end 
    
    it "renders the :contact view" do
      response.should render_template :contact
    end  
  end

  describe "GET privacy" do
    before :each do
      get :privacy
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
    
    it "assigns a page @breadcrumb" do
      assigns(:breadcrumb).should_not be_nil
    end 
    
    it "renders the :privacy view" do
      response.should render_template :privacy
    end  
  end

  describe "GET mobile_under_construction" do
    before :each do
      get :mobile_under_construction
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
    
    it "renders the :mobile layout" do
      response.should render_template :mobile
    end
    
    it "renders the :mobile_under_construction view" do
      response.should render_template :mobile_under_construction
    end  
  end

  describe "GET dashboard unauthenticated" do
    
    before :each do
      get :dashboard
    end
    
    it "should return a 401 with no basic auth" do
      response.status.should == 401
    end
  
  end
  
  describe "GET dashboard authenticated" do
    
    before :each do
      http_login
      get :dashboard
    end
    
    it 'should return a 200 with valid basic auth' do
      response.status.should == 200
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
    
    it "assigns a page @breadcrumb" do
      assigns(:breadcrumb).should_not be_nil
    end 
    
    it "renders the :privacy view" do
      response.should render_template :dashboard
    end  
    
  end
  
  describe "GET login unauthenticated" do
       
    before :each do
      get :login
    end
    
    it "should return a 401 with no basic auth" do
      response.status.should == 401
    end
  
  end

  describe "GET login authenticated" do
    
    before :each do
      http_login
      get :login
    end
    
    it 'should return a 302 redirect with valid basic auth' do
      response.status.should == 302
    end
  
    it 'should redirect to the dashboard' do
      response.should redirect_to "/Dashboard"
    end
  end
   

end
