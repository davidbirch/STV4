require 'spec_helper'

describe Program do
  
  it "has a valid factory" do
    program = FactoryGirl.create(:program)
    #puts("\n #{program.inspect}")
    #puts("#{program.sport.inspect}")
    #puts("#{program.region.inspect}")
    #puts("#{program.channel.inspect}")
    program.should be_valid

  end
  
end