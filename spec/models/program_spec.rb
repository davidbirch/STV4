# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  subtitle       :string(255)
#  region_id      :integer
#  sport_id       :integer
#  channel_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category       :string(255)
#  description    :string(255)
#  start_datetime :datetime
#  end_datetime   :datetime
#

require 'spec_helper'

describe Program do
  
  it "has a valid factory" do
    FactoryGirl.create(:program).should be_valid
  end
  
  it "is invalid without a title" do
    FactoryGirl.build(:program, title: nil).should validate_presence_of(:title)
  end
    
  it "is invalid without a start date/time" do
    FactoryGirl.build(:program, start_datetime: nil).should validate_presence_of(:start_datetime)
  end
  
  it "is invalid without an end date/time" do
    FactoryGirl.build(:program, end_datetime: nil).should validate_presence_of(:end_datetime)
  end
  
  it "is invalid without a region_id" do
    FactoryGirl.build(:program, region_id: nil).should validate_presence_of(:region_id)
  end
  
  it "is invalid without a sport_id" do
    FactoryGirl.build(:program, sport_id: nil).should validate_presence_of(:sport_id)
  end
  
  it "is invalid without a channel_id" do
    FactoryGirl.build(:program, channel_id: nil).should validate_presence_of(:channel_id)
  end
    
  it "should belong to a region" do
    FactoryGirl.build(:program).should belong_to(:region)
  end  
  
  it "should belong to a channel" do
    FactoryGirl.build(:program).should belong_to(:channel)
  end
  
  it "should belong to a sport" do
    FactoryGirl.build(:program).should belong_to(:sport)
  end
  
  it "is invalid without a unique channel/region/start/end" do
    FactoryGirl.build(:program).should validate_uniqueness_of(:channel_id)
  end
  
  
  
  describe "should validate the uniqueness of channel for a specified region, start_datetime, and end_datetime" do
    
    before :each do
      @sport_cricket = FactoryGirl.create(:cricket_sport)
      @channel_nine = FactoryGirl.create(:channel_nine)
      @channel_seven = FactoryGirl.create(:channel_seven)
      @region_melbourne = FactoryGirl.create(:region_melbourne)
      @region_brisbane = FactoryGirl.create(:region_brisbane)
      
      @program_1 = FactoryGirl.create(:valid_program, channel_id: @channel_nine.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id)
    end
    
    context "where they all match" do
      it "does not create a duplicate program" do
        FactoryGirl.build(:valid_program, channel_id: @channel_nine.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id).valid?.should be_false
      end
    end
    
    context "where the channel is different" do
      it "creates a program" do
        FactoryGirl.build(:valid_program, channel_id: @channel_seven.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id).valid?.should be_true
      end
    end
    
    context "where the region is different" do
      it "creates a program" do
        FactoryGirl.build(:valid_program, channel_id: @channel_nine.id, region_id: @region_brisbane.id, sport_id: @sport_cricket.id).valid?.should be_true
      end
    end
   
    context "where the start_datetime is different" do
      it "creates a program" do
        FactoryGirl.build(:valid_program, channel_id: @channel_nine.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id, start_datetime: TEN_PM_YESTERDAY_PROG).valid?.should be_true
      end
    end
   
    context "where the end_datetime is different" do
      it "creates a program" do
        FactoryGirl.build(:valid_program, channel_id: @channel_nine.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id, end_datetime: ELEVEN_PM_YESTERDAY_PROG).valid?.should be_true  
      end
    end  
  end
   
    
  #it "can create a program based on a raw_program" do
  #  tennis_raw_program = FactoryGirl.create(:tennis_raw_program)
  #  channel_seven = FactoryGirl.create(:channel_seven)
  #  Program.create_from_raw_program(tennis_raw_program).should be_valid
  #end
  
end
