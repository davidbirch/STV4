require 'spec_helper'

describe "Static Pages - " do
  
  describe "home page" do
    
    before(:each) do
      get root_path
    end
    
    it "should exist" do
      response.status.should be(200)  
    end
    
    it "should have the right title" do
      response.body.should have_selector("title", :text => "Sport on Television in Australia")
    end
    
    describe "header" do
      
      it "should exist" do
        response.body.should have_selector("header")
      end
      
      it "should have the right text" do
        response.body.should have_selector("header", :text => "SPORT ON TV")
      end
      
      it "should have the right text" do
        response.body.should have_selector("header", :text => "Every sport on every channel")
      end
      
    end
        
    describe "footer" do
      
      it "should have a footer" do
        response.body.should have_selector("footer")
      end
      
      it "should exist" do
        response.body.should have_selector(".upper_footer")
      end
      
      it "should have a lower section" do
        response.body.should have_selector(".lower_footer")
      end
      
      it "should have social media links" do
        response.body.should have_selector(".upper_footer", :text => "Get Social")
      end
      
      #it "should have a list of regions" do
      #  response.body.should have_selector(".upper_footer", :text => "Regions")
      #end
      
      #it "should have a list of pages" do
      #  response.body.should have_selector(".upper_footer", :text => "Pages")
      #end
      
    end
    
    
    
  end
end