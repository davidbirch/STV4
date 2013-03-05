# == Schema Information
#
# Table name: raw_channels
#
#  id           :integer          not null, primary key
#  xmltv_id     :string(255)
#  channel_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe RawChannel do
  
  it "has a valid factory" do
    FactoryGirl.create(:raw_channel).should be_valid
  end
    
  it "is invalid without an xmltv_id" do
    FactoryGirl.build(:raw_channel, xmltv_id: nil).should validate_presence_of(:xmltv_id)
  end
 
  it "is invalid without a channel name" do
    FactoryGirl.build(:raw_channel, channel_name: nil).should validate_presence_of(:channel_name)
  end
  
  it "is invalid without a unique channel name" do
    FactoryGirl.build(:raw_channel).should validate_uniqueness_of(:channel_name)
  end
  
  it "is invalid without a unique xmltv_id" do
    FactoryGirl.build(:raw_channel).should validate_uniqueness_of(:xmltv_id)
  end
  
end
