require 'spec_helper'

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
      page.find("title").should have_content("Sport on Television")
    end
    
    describe "header" do
      
      it "should exist" do
        page.find("header")
      end
      
      it "should have the right text" do
        page.find("header").should have_content("SPORT ON TV")
      end
      
      it "should have the right text" do
        page.find("header").should have_content("Every sport on every channel")
      end
      
    end
        
    describe "footer" do
      
      it "should exist" do
        page.find("footer")
      end
      
      it "should have an upper section" do
        page.find(".upper_footer")
      end
      
      it "should have a lower section" do
        page.find(".lower_footer")
      end
      
      it "should have social media links in the upper section" do
        find(".upper_footer").should have_content("Get Social")
        end
      
    end
    
    describe "left content" do
      
      it "should exist" do
        page.find(".left_content")
      end
      
    end
    
    describe "right content" do
      
      it "should exist" do
        page.find(".right_content")
      end
      
    end    
    
  end
  
end