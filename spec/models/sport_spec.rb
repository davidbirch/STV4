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
  
  it "is invalid without a unique name" do
    FactoryGirl.build(:sport).should validate_uniqueness_of(:name)
  end
  
  it "should have many sport keywords" do
    FactoryGirl.build(:sport).should have_many(:sport_keywords)
  end
  
  it "should have many programs" do
    FactoryGirl.build(:sport).should have_many(:programs)
  end
  
  describe "can find the correct sport based on a raw program" do
    
    before :each do
      @other_sport = FactoryGirl.create(:other_sport)
      @cricket_sport = FactoryGirl.create(:cricket_sport)
      @cricket_sport_keyword = FactoryGirl.create(:cricket_sport_keyword, sport_id: @cricket_sport.id)
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
        terminator_keyword_raw_program = FactoryGirl.create(:terminator_keyword_raw_program)
        Sport.find_for_raw_program(terminator_keyword_raw_program).should be_nil
      end
    end 
  end

end
