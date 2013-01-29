require 'spec_helper'

describe RawProgram do
  
  it "has a valid factory" do
    raw_program = FactoryGirl.create(:raw_program)
    #puts("\n #{raw_program.inspect}")
    raw_program.should be_valid
  end
  
end
