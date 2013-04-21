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
    
    it "adds a new program and displays the results" do
      FactoryGirl.create(:cricket_sport)
      FactoryGirl.create(:channel_nine)
      FactoryGirl.create(:region_melbourne)
  
      http_feature_login
      visit programs_url
      expect{
        within(:css, 'div.right_content'){
          click_link('New')
        }
        fill_in 'program_title', with:  "The Ashes"
        fill_in 'program_subtitle', with: "Australia vs England"
        fill_in 'program_description', with: "Live Coverage from the Ashes"
        fill_in 'program_category', with: "Live Sport/Cricket"
        select "Melbourne", :from => 'program_region_id'
        select "Cricket", :from => 'program_sport_id' 
        select "Nine", :from => 'program_channel_id'
        select (DateTime.now + 1).year, :from => 'program_start_datetime_1i'
        select (DateTime.now + 1).strftime("%B"), :from => 'program_start_datetime_2i'
        select (DateTime.now + 1).day, :from => 'program_start_datetime_3i'
        select 18, :from => 'program_start_datetime_4i'
        select 30, :from => 'program_start_datetime_5i'
        select (DateTime.now + 1).year, :from => 'program_end_datetime_1i'
        select (DateTime.now + 1).strftime("%B"), :from => 'program_end_datetime_2i'
        select (DateTime.now + 1).day, :from => 'program_end_datetime_3i'
        select 19, :from => 'program_end_datetime_4i'
        select 30, :from => 'program_end_datetime_5i'
        click_button "Create Program"
      }.to change(Program,:count).by(1)
      page.status_code.should be(200)
      page.should have_content "Program was successfully created."
      page.should have_content "The Ashes (Australia vs England)"
    end
    
    it "deletes a program" do
      @sport_cricket = FactoryGirl.create(:cricket_sport)
      @channel_nine = FactoryGirl.create(:channel_nine)
      @region_melbourne = FactoryGirl.create(:region_melbourne)
      @program_1 = FactoryGirl.create(:valid_program, channel_id: @channel_nine.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id)
      
      http_feature_login
      visit programs_url
      expect{
        within "#program_#{@program_1.id}" do
          click_link 'Destroy'
        end
      }.to change(Program,:count).by(-1)
      page.should have_content "Listing Programs" 
    end  
      
    
  end
  
end