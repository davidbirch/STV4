require 'spec_helper'

describe Sport do
  
  it "has a valid factory" do
    sport = FactoryGirl.create(:sport)
    #puts("\n #{sport.inspect}")
    sport.should be_valid
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
  
  
end
