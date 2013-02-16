require 'spec_helper'

describe PagesController do

  describe "GET about" do
    before :each do
      get :about
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
    
    it "renders the :about view" do
      response.should render_template :about
    end  
  end

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

  describe "GET dashboard" do
    
    it "assigns a page @title" 
    
    it "assigns a page @meta_keywords" 
   
    it "assigns a page @meta_description" 
    
    it "assigns a page @breadcrumb" 
    
    it "renders the :dashboard view"
    
  end
  
  describe "GET login" do
        
    it "redirects to the dashboard view"
    
  end

end
