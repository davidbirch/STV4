# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Sport do
  
  it "has a valid factory" do
    FactoryGirl.create(:sport).should be_valid
  end
  
  it "is invalid without a sport name" do
    FactoryGirl.build(:sport, name: nil).should_not be_valid
  end
  
  it "is pre-populated with seed data" do
    Sport.all.count.should be > 0
  end
  
  it "is pre-populated with a 'Cricket' seed entry" do
    Sport.find_by_name('Cricket').should_not be_nil
  end

  describe "can find the correct sport based on a raw program" do
    
    before :each do
      @cricket_sport_keyword = FactoryGirl.create(:cricket_sport_keyword)
      @terminator_black_keyword = FactoryGirl.create(:terminator_black_keyword)
    end
    
    context "where the raw program has a valid sport" do
      it "returns a valid Sport" do
        cricket_raw_program = FactoryGirl.create(:cricket_raw_program)
        Sport.find_for_raw_program(cricket_raw_program).should_not be_nil
      end
    end
    
    context "where the raw program has a general sport match" do
      it "returns the 'Other Sport' name" do
        other_sport_raw_program = FactoryGirl.create(:other_sport_raw_program)
        Sport.find_for_raw_program(other_sport_raw_program).should_not be_nil
      end
    end
    
    context "where the raw program is Sport/News" do
      it "returns an empty result" do
        news_raw_program = FactoryGirl.create(:news_raw_program)
        Sport.find_for_raw_program(news_raw_program).should be_nil
      end     
    end
    
    context "where the raw program is not a sport" do
      it "returns an empty result" do
        non_sport_raw_program = FactoryGirl.create(:non_sport_raw_program)
        Sport.find_for_raw_program(non_sport_raw_program).should be_nil
      end     
    end
    
    context "where the raw program has a Black Keyword match" do
      it "returns an empty result" do
        black_keyword_raw_program = FactoryGirl.create(:black_keyword_raw_program)
        Sport.find_for_raw_program(black_keyword_raw_program).should be_nil
      end
    end
   
  end



end
