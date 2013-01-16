require 'spec_helper'

describe Channel do
  
  it "has a valid factory" do
    channel = FactoryGirl.create(:channel)
    puts("\n #{channel.inspect}")
    channel.should be_valid
    
  end
  
  it "is invalid without a channel name" do
    FactoryGirl.build(:channel, name: nil).should_not be_valid
  end
  
end