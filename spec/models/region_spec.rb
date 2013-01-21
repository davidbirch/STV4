require "spec_helper"

describe Region do

  it "has a valid factory" do
    region = FactoryGirl.create(:region)
    #puts("\n #{region.inspect}")
    region.should be_valid
  end
  
  it "is invalid without a region name" do
    FactoryGirl.build(:region, name: nil).should_not be_valid
  end
  
  it "is pre-populated with seed data" do
    Region.all.count.should be > 0
  end
  
  it "is pre-populated with a 'Melbourne' seed entry" do
    Region.find_by_name('Melbourne').should_not be_nil
  end
    
end
