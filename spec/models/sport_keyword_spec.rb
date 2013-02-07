# == Schema Information
#
# Table name: sport_keywords
#
#  id         :integer          not null, primary key
#  rule_type  :string(255)
#  value      :string(255)
#  sport_id   :integer
#  priority   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe SportKeyword do
 
  it "has a valid factory" do
    FactoryGirl.create(:sport_keyword).should be_valid
  end
  
  it "is invalid without a rule type" do
    FactoryGirl.build(:sport_keyword, rule_type: nil).should_not be_valid
  end
  
  it "is invalid without a value" do
    FactoryGirl.build(:sport_keyword, value: nil).should_not be_valid
   end
      
  it "is pre-populated with seed data" do
    SportKeyword.all.count.should be > 0
  end
  
  it "has a default value_length attribute" do
    FactoryGirl.create(:sport_keyword, value: "Testing")
    sport_keyword = SportKeyword.find_by_value("Testing").value_length.should eq(7)
        
  end
  
  it "is pre-populated with a 'Cricket' seed entry" do
    SportKeyword.find_by_value('Cricket').should_not be_nil
  end
    
  describe "can check a raw program and return the correct sport" do
    
    before :each do
      @cricket_sport_keyword = FactoryGirl.create(:cricket_sport_keyword)
      @terminator_black_keyword = FactoryGirl.create(:terminator_black_keyword)
    end
     
    context "where the raw program has a valid sport" do
      it "returns the valid sport name" do
        cricket_raw_program = FactoryGirl.create(:cricket_raw_program)
        SportKeyword.check_raw_program(cricket_raw_program).should eq "Cricket" 
      end
    end
    
    context "where the raw program has a general sport match" do
      it "returns the 'Other Sport' name" do
        other_sport_raw_program = FactoryGirl.create(:other_sport_raw_program)
        SportKeyword.check_raw_program(other_sport_raw_program).should eq "Other Sport" 
      end
    end
    
    context "where the raw program is Sport/News" do
      it "returns an empty result" do
        news_raw_program = FactoryGirl.create(:news_raw_program)
        SportKeyword.check_raw_program(news_raw_program).should eq "" 
      end     
    end
    context "where the raw program is not a sport" do
      it "returns an empty result" do
        non_sport_raw_program = FactoryGirl.create(:non_sport_raw_program)
        SportKeyword.check_raw_program(non_sport_raw_program).should eq "" 
      end     
    end
    
    context "where the raw program has a Black Keyword match" do
      it "returns an empty result" do
        black_keyword_raw_program = FactoryGirl.create(:black_keyword_raw_program)
        SportKeyword.check_raw_program(black_keyword_raw_program).should eq "" 
      end
    end
   
  end

end
