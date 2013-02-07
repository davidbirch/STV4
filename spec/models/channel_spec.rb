# == Schema Information
#
# Table name: channels
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  short_name  :string(255)
#  free_or_pay :string(255)
#  xmltv_id    :string(255)
#

require 'spec_helper'

describe Channel do
  
  it "has a valid factory" do
    FactoryGirl.create(:channel).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:channel, name: nil).should_not be_valid
  end
  
  it "is invalid without a short name" do
    FactoryGirl.build(:channel, short_name: nil).should_not be_valid
  end
  
  it "is invalid without an xmltv_id" do
    FactoryGirl.build(:channel, xmltv_id: nil).should_not be_valid
  end
  
  describe "can create a channel based on a raw channel" do
    
    before :each do
      #@channel_nine = FactoryGirl.create(:channel_nine)
    end
    
    context "where the channel already exists" do
    #  raw_channel_nine = FactoryGirl.create(:channel_nine)
    #  channel = Channel.create_from_raw_channel(raw_channel)
    #  Channel.find_all_by_name('Nine').count should eq(1)
    end
        
    context "where the channel does not exist" do
    #  raw_channel_seven = FactoryGirl.create(:channel_seven)
    #  channel = Channel.create_from_raw_channel(raw_channel)
    #  Channel.find_all_by_name('Seven').count should eq(1)
    end
    
  end

end
