# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "spec_helper"

describe Region do

  it "has a valid factory" do
    FactoryGirl.create(:region).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:region, name: nil).should_not be_valid
  end
 
  it "is invalid without a unique name" do
    FactoryGirl.create(:region).should validate_uniqueness_of(:name)
  end
  
  it "should have many programs" do
    FactoryGirl.create(:region).should have_many(:programs)
  end
  
  
end
