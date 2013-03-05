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
    FactoryGirl.build(:channel, name: nil).should validate_presence_of(:name)
  end
  
  it "is invalid without a short name" do
    FactoryGirl.build(:channel, short_name: nil).should validate_presence_of(:short_name)
  end
  
  it "is invalid without an xmltv id" do
    FactoryGirl.build(:channel, xmltv_id: nil).should validate_presence_of(:xmltv_id)
  end
  
  it "is invalid without a unique name" do
    FactoryGirl.build(:channel).should validate_uniqueness_of(:name)
  end
  
  it "is invalid without a unique xmltv_id" do
    FactoryGirl.build(:channel).should validate_uniqueness_of(:xmltv_id)
  end
  
  it "should have many programs" do
    FactoryGirl.build(:channel).should have_many(:programs)
  end
    
  describe "can create a channel based on a raw channel" do
    
    before :each do
      @channel_nine = FactoryGirl.create(:channel_nine)
    end
    
    context "where the channel already exists" do
      it "does not create a duplicate channel" do
        raw_channel_nine = FactoryGirl.create(:raw_channel_nine)
        Channel.create_from_raw_channel(raw_channel_nine).new_record?.should be_true
      end
    end
        
    context "where the channel does not exist" do
      it "creates a new channel" do
        raw_channel_seven = FactoryGirl.create(:raw_channel_seven)
        Channel.create_from_raw_channel(raw_channel_seven).new_record?.should be_false
      end 
    end
    
  end

end
