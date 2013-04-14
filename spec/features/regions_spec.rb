require 'spec_helper'

describe "Regions" do
  
  include AuthHelper
    
  describe "regions page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Regions')
        }
      page.status_code.should be(200)  
    end
  end
  
  describe "new regions page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Regions')
        }
      within(:css, 'div.right_content'){
        click_link('New')
        }
      page.status_code.should be(200)  
    end
  end
  
end