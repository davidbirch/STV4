require 'spec_helper'

describe "raw_channels/edit" do
  before(:each) do
    @raw_channel = assign(:raw_channel, stub_model(RawChannel,
      :xmltv_id => "MyString",
      :channel_name => "MyString"
    ))
  end

  it "renders the edit raw_channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => raw_channels_path(@raw_channel), :method => "post" do
      assert_select "input#raw_channel_xmltv_id", :name => "raw_channel[xmltv_id]"
      assert_select "input#raw_channel_channel_name", :name => "raw_channel[channel_name]"
    end
  end
end
