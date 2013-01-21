require 'spec_helper'

describe "raw_channels/index" do
  before(:each) do
    assign(:raw_channels, [
      stub_model(RawChannel,
        :xmltv_id => "Xmltv",
        :channel_name => "Channel Name"
      ),
      stub_model(RawChannel,
        :xmltv_id => "Xmltv",
        :channel_name => "Channel Name"
      )
    ])
  end

  it "renders a list of raw_channels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Xmltv".to_s, :count => 2
    assert_select "tr>td", :text => "Channel Name".to_s, :count => 2
  end
end
