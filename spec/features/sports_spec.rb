require 'spec_helper'

describe "Sports" do
  
  include AuthHelper
    
  describe "sports page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Sports')
        }
      page.status_code.should be(200)  
    end
  end
  
  describe "new sports page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Sports')
        }
      within(:css, 'div.right_content'){
        click_link('New')
        }
      page.status_code.should be(200)  
    end
  end
  
end