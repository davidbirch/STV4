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
    
    it "adds a new region and displays the results" do
      http_feature_login
      visit regions_url
      expect{
        within(:css, 'div.right_content'){
          click_link('New')
        }
        fill_in 'region_name', with:  "Hobart"
        click_button "Create Region"
      }.to change(Region,:count).by(1)
      page.status_code.should be(200)
      page.should have_content "Region was successfully created."
    end
    
    it "deletes a region" do
      @region_melbourne = FactoryGirl.create(:region_melbourne)
      http_feature_login
      visit regions_url
      expect{
        within "#region_#{@region_melbourne.id}" do
          click_link 'Destroy'
        end
      }.to change(Region,:count).by(-1)
      page.should have_content "Listing Regions" 
    end  
  end
  
end