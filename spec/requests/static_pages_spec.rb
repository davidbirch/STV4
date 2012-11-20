require 'spec_helper'

# Useful reference links
# https://github.com/jnicklas/capybara
# https://gist.github.com/428105

describe "Static Pages - " do
  
  describe "site" do
    
    before(:each) do
      get root_path
    end
    
    it "should exist" do
      response.status.should be(200)  
    end
    
  end
    
  describe "home page" do
    
    before(:each) do
      visit(root_path)
    end
    
    it "should have the right path" do
      current_path.should == root_path
    end
    
    it "should have the right title" do
      find("title").should have_content("Sport on Television")
    end
    
    describe "header" do
      
      it "should exist" do
        find("header")
      end
      
      it "should have the right text" do
        find("header").should have_content("SPORT ON TV")
      end
      
      it "should have the right text" do
        find("header").should have_content("Every sport on every channel")
      end
      
    end
        
    describe "footer" do
      
      it "should exist" do
        find("footer")
      end
      
      it "should have an upper section" do
        find(".upper_footer")
      end
      
      it "should have a lower section" do
        find(".lower_footer")
      end
      
      it "should have social media links in the upper section" do
        find(".upper_footer").should have_content("Get Social")
      end
      
    end
    
    describe "left content" do
      
      it "should exist" do
        find(".left_content")
      end
      
    end
    
    describe "right content" do
      
      it "should exist" do
        find(".right_content")
      end
      
    end
    
    describe "region list" do
      
      it "should exist in the right content of the home page" do
        find(".right_content").should have_content("Region List")
        find(".right_content").should have_content("Melbourne")
        
      end
    end
    
  end
    
end