require 'spec_helper'

describe "raw_programs/show" do
  before(:each) do
    @raw_program = assign(:raw_program, stub_model(RawProgram,
      :title => "Title",
      :subtitle => "Subtitle",
      :category => "Category",
      :description => "Description",
      :region_name => "Region Name",
      :channel_xmltv_id => "Channel Xmltv"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Subtitle/)
    rendered.should match(/Category/)
    rendered.should match(/Description/)
    rendered.should match(/Region Name/)
    rendered.should match(/Channel Xmltv/)
  end
end
