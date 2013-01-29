require 'spec_helper'

describe RawChannel do
  
  it "has a valid factory" do
    raw_channel = FactoryGirl.create(:raw_channel)
    #puts("\n #{raw_channel.inspect}")
    raw_channel.should be_valid
  end
  
end

describe RawChannelMigrator do
  
  
end
