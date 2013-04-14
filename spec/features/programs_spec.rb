require 'spec_helper'

describe "Programs" do
  
  include AuthHelper
    
  describe "programs page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Programs')
        }
      page.status_code.should be(200)  
    end
  end
  
  describe "new programs page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Programs')
        }
      within(:css, 'div.right_content'){
        click_link('New')
        }
      page.status_code.should be(200)  
    end
  end
  
end