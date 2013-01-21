require 'spec_helper'

describe "raw_programs/new" do
  before(:each) do
    assign(:raw_program, stub_model(RawProgram,
      :title => "MyString",
      :subtitle => "MyString",
      :category => "MyString",
      :description => "MyString",
      :region_name => "MyString",
      :channel_xmltv_id => "MyString"
    ).as_new_record)
  end

  it "renders new raw_program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => raw_programs_path, :method => "post" do
      assert_select "input#raw_program_title", :name => "raw_program[title]"
      assert_select "input#raw_program_subtitle", :name => "raw_program[subtitle]"
      assert_select "input#raw_program_category", :name => "raw_program[category]"
      assert_select "input#raw_program_description", :name => "raw_program[description]"
      assert_select "input#raw_program_region_name", :name => "raw_program[region_name]"
      assert_select "input#raw_program_channel_xmltv_id", :name => "raw_program[channel_xmltv_id]"
    end
  end
end
