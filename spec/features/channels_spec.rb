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
  
  describe "new channels" do
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
    
    it "adds a new channel and displays the results" do
      http_feature_login
      visit channels_url
      expect{
        within(:css, 'div.right_content'){
          click_link('New')
        }
        fill_in 'channel_name', with:  "Nine"
        fill_in 'channel_short_name', with:  "Nine"
        fill_in 'channel_xmltv_id', with: "nine.free.au"
        click_button "Create Channel"
      }.to change(Channel,:count).by(1)
      page.status_code.should be(200)
      page.should have_content "Channel was successfully created."
    end
    
    it "deletes a channel" do
      @channel_nine = FactoryGirl.create(:channel_nine)
      http_feature_login
      visit channels_url
      expect{
        within "#channel_#{@channel_nine.id}" do
          click_link 'Destroy'
        end
      }.to change(Channel,:count).by(-1)
      page.should have_content "Listing Channels" 
    end
  end
  
end