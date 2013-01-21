require 'spec_helper'

describe "raw_programs/index" do
  before(:each) do
    assign(:raw_programs, [
      stub_model(RawProgram,
        :title => "Title",
        :subtitle => "Subtitle",
        :category => "Category",
        :description => "Description",
        :region_name => "Region Name",
        :channel_xmltv_id => "Channel Xmltv"
      ),
      stub_model(RawProgram,
        :title => "Title",
        :subtitle => "Subtitle",
        :category => "Category",
        :description => "Description",
        :region_name => "Region Name",
        :channel_xmltv_id => "Channel Xmltv"
      )
    ])
  end

  it "renders a list of raw_programs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Region Name".to_s, :count => 2
    assert_select "tr>td", :text => "Channel Xmltv".to_s, :count => 2
  end
end
