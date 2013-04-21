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
    
    it "adds a new sport keyword and displays the results" do
      FactoryGirl.create(:cricket_sport)
      
      http_feature_login
      visit sport_keywords_url
      expect{
        within(:css, 'div.right_content'){
          click_link('New')
        }
        fill_in 'sport_keyword_rule_type', with:  "White Keyword"
        fill_in 'sport_keyword_value', with:  "The Ashes"
        select "Cricket", :from => 'sport_keyword_sport_id'
        fill_in 'sport_keyword_priority', with:  10
        click_button "Create Sport keyword"
      }.to change(SportKeyword,:count).by(1)
      page.status_code.should be(200)
      page.should have_content "Sport keyword was successfully created."
    end
    
    it "deletes a sport keyword" do
      @tennis_sport_keyword = FactoryGirl.create(:tennis_sport_keyword)
      http_feature_login
      visit sport_keywords_url
      expect{
        within "#sport_keyword_#{@tennis_sport_keyword.id}" do
          click_link 'Destroy'
        end
      }.to change(SportKeyword,:count).by(-1)
      page.should have_content "Listing Sport Keywords" 
    end  
  end
  
end