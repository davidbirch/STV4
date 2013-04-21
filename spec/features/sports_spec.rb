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
    
    it "adds a new sport and displays the results" do
      http_feature_login
      visit sports_url
      expect{
        within(:css, 'div.right_content'){
          click_link('New')
        }
        fill_in 'sport_name', with:  "AFL"
        click_button "Create Sport"
      }.to change(Sport,:count).by(1)
      page.status_code.should be(200)
      page.should have_content "Sport was successfully created."
    end
    
    it "deletes a sport" do
      @cricket_sport = FactoryGirl.create(:cricket_sport)
      http_feature_login
      visit sports_url
      expect{
        within "#sport_#{@cricket_sport.id}" do
          click_link 'Destroy'
        end
      }.to change(Sport,:count).by(-1)
      page.should have_content "Listing Sports" 
    end  
  end
  
end