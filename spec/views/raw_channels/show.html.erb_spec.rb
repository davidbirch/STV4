require 'spec_helper'

describe "raw_channels/show" do
  before(:each) do
    @raw_channel = assign(:raw_channel, stub_model(RawChannel,
      :xmltv_id => "Xmltv",
      :channel_name => "Channel Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Xmltv/)
    rendered.should match(/Channel Name/)
  end
end
