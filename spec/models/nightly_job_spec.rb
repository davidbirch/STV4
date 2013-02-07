require 'spec_helper'

describe NightlyJob do
  
  describe "on initialize" do
    
    before :each do
      
    FactoryGirl.create(:raw_channel)
    FactoryGirl.create(:raw_channel_nine)
    FactoryGirl.create(:raw_channel_seven)
    
    FactoryGirl.create(:historic_raw_program)
    FactoryGirl.create(:historic_program)
        
    FactoryGirl.create(:valid_raw_program) 
    FactoryGirl.create(:tennis_raw_program) 
    FactoryGirl.create(:cricket_raw_program) 
    FactoryGirl.create(:other_sport_raw_program) 
    FactoryGirl.create(:non_sport_raw_program) 
    FactoryGirl.create(:black_keyword_raw_program) 
    
    FactoryGirl.create(:cricket_sport_keyword) 
    FactoryGirl.create(:terminator_black_keyword) 
      
    end
    
    context "when initialize is run" do
      it "should complete" do
        nightly_job = NightlyJob.new
        
        puts "hello"
        Program.all.count.should be > 0
        Program.historic.count.should eq 0
        Channel.all.count.should be > 0
        RawProgram.all.count.should eq 0
        RawChannel.all.count.should eq 0
      end
    end
    
  end

end
