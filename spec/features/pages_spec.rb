require 'spec_helper'

# Useful reference links
# https://github.com/jnicklas/capybara
# https://gist.github.com/428105

describe "Pages" do
  
  include AuthHelper
  
  describe "site" do
    it "should exist" do
      visit root_path
      page.status_code.should be(200)  
    end 
  end
  
  describe "contact page" do
    it "should exist" do
      visit root_path
      within(:css, 'div.left_content'){
        click_link('Contact')
        }
      page.status_code.should be(200)  
    end 
  end
  
  describe "privacy page" do
    it "should exist" do
      visit root_path
      within(:css, 'div.left_content'){
        click_link('Privacy')
        }
      page.status_code.should be(200)  
    end 
  end
  
  describe "dashboard page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Dashboard"
      page.status_code.should be(200)  
    end
    
    it "should not exist when unauthenticated" do
      visit "/Dashboard"
      page.status_code.should be(401)  
    end    
  end
  
  describe "login page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      page.status_code.should be(200)  
    end
    
    it "should not exist when unauthenticated" do
      visit "/Login"
      page.status_code.should be(401)  
    end    
  end
  
end