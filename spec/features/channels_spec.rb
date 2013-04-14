require 'spec_helper'

describe "Channels" do
  
  include AuthHelper
    
  describe "channels page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Channels')
        }
      page.status_code.should be(200)  
    end
  end
  
  describe "new channels page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      within(:css, 'div.left_content'){
        click_link('Channels')
        }
      within(:css, 'div.right_content'){
        click_link('New')
        }
      page.status_code.should be(200)  
    end
  end
  
end