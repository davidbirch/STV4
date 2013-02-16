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
    FactoryGirl.build(:program, title: nil).should_not be_valid
  end
    
  it "is invalid without a start date/time" do
    FactoryGirl.build(:program, start_datetime: nil).should_not be_valid
  end
  
  it "is invalid without an end date/time" do
    FactoryGirl.build(:program, end_datetime: nil).should_not be_valid
  end
  
  it "is invalid without a region_id" do
    FactoryGirl.build(:program, region_id: nil).should_not be_valid
  end
  
  it "is invalid without a sport_id" do
    FactoryGirl.build(:program, sport_id: nil).should_not be_valid
  end
  
  it "is invalid without a channel_id" do
    FactoryGirl.build(:program, channel_id: nil).should_not be_valid
  end
  
  it "has a start_date with a valid format" 
    
  it "has an end_date with a valid format" 
  
  it "has a start_time with a valid format" 
    
  it "has an end_time with a valid format" 
    
  it "can create a program based on a raw_program" do
    tennis_raw_program = FactoryGirl.create(:tennis_raw_program)
    channel_seven = FactoryGirl.create(:channel_seven)
    Program.create_from_raw_program(tennis_raw_program).should be_valid
  end
  
  describe "can select all historic programs" do
      
    context "where the program is in the future" do
      it "should not return an array containing the valid programs" do
        valid_program = FactoryGirl.create(:valid_program)
        historic_programs = Program.historic || []
        historic_programs.should_not include(valid_program) 
      end
    end
        
    context "where the program is in the past" do
      it "is should return an array containing the historic program" do
        historic_program = FactoryGirl.create(:historic_program)
        historic_programs = Program.historic || []
        historic_programs.should include(historic_program)
      end
    end
    
  end
  
  describe "can select all current programs" do
      
    context "where the program is in the future" do
      it "should return an array containing the valid programs" do
        valid_program = FactoryGirl.create(:valid_program)
        historic_programs = Program.current || []
        historic_programs.should include(valid_program) 
      end
    end
        
    context "where the program is in the past" do
      it "should not return an array containing the historic program" do
        historic_program = FactoryGirl.create(:historic_program)
        historic_programs = Program.current || []
        historic_programs.should_not include(historic_program)
      end
    end
    
  end
  
  describe "can select, format and sort programs for html" do
    it "should return an array containing the valid programs"
      
  end
    
end
