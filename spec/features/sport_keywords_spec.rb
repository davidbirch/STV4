require 'spec_helper'

describe "SportKeywords" do
  
  include AuthHelper
    
  describe "sport keywords page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Sport Keywords')
        }
      page.status_code.should be(200)  
    end
  end
  
  describe "new sport keywords page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Sport Keywords')
        }
      within(:css, 'div.right_content'){
        click_link('New')
        }
      page.status_code.should be(200)  
    end
  end
  
end