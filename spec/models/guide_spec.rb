require 'spec_helper'

describe Guide do
      
  describe "can be instantiated with the relevant input information" do
    
    before :each do
      @sport_cricket = FactoryGirl.create(:cricket_sport)
      @region_melbourne = FactoryGirl.create(:region_melbourne)
      @search_string = "The Ashes"
    end
    
    context "where there is a valid region" do
      it "is instantiated" do
        Guide.new(@region_melbourne,nil,nil).should_not be_nil
      end
    end
    
    context "where there is a valid region and sport" do
      it "is instantiated" do
        Guide.new(@region_melbourne,@sport_cricket,nil).should_not be_nil
      end
    end
    
    context "where there is a valid region and search string" do
      it "is instantiated" do
        Guide.new(@region_melbourne,nil,@search_string).should_not be_nil
      end
    end
      
  end
  
  describe "should return the right set of programs" do
    
    before :each do
      @sport_cricket = FactoryGirl.create(:cricket_sport)
      @sport_tennis = FactoryGirl.create(:tennis_sport)
      @channel_nine = FactoryGirl.create(:channel_nine)
      @channel_seven = FactoryGirl.create(:channel_seven)
      @region_melbourne = FactoryGirl.create(:region_melbourne)
      @region_brisbane = FactoryGirl.create(:region_brisbane)
      @search_string = "The Ashes"
      
      @program1_nine_melb_cricket = FactoryGirl.create(:valid_program, channel_id: @channel_nine.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id, title: "The Ashes")
      @program2_nine_bris_cricket = FactoryGirl.create(:valid_program, channel_id: @channel_nine.id, region_id: @region_brisbane.id, sport_id: @sport_cricket.id, title: "The Ashes")
      @program3_seven_melb_cricket = FactoryGirl.create(:valid_program, channel_id: @channel_seven.id, region_id: @region_melbourne.id, sport_id: @sport_cricket.id, title: "Aus vs Ind")
      @program4_seven_melb_tennis = FactoryGirl.create(:valid_program, channel_id: @channel_seven.id, region_id: @region_melbourne.id, sport_id: @sport_tennis.id, title: "Wimbledon")
    end
     
    context "where there is a valid region" do
      it "returns the programs for that region" do
        Guide.new(@region_melbourne,nil,nil).programs_for_html.should include(@program1_nine_melb_cricket,@program3_seven_melb_cricket,@program4_seven_melb_tennis)
      end
      
      it "does not return the programs for other regions" do
        Guide.new(@region_melbourne,nil,nil).programs_for_html.should_not include(@program2_nine_bris_cricket)
      end
      
    end
    
    context "where there is a valid region and sport" do
      it "returns the programs for that region and sport" do
        Guide.new(@region_melbourne,@sport_cricket,nil).programs_for_html.should include(@program1_nine_melb_cricket,@program3_seven_melb_cricket)
      end
      
      it "does not return the programs for other regions or other sports" do
        Guide.new(@region_melbourne,@sport_cricket,nil).programs_for_html.should_not include(@program2_nine_bris_cricket,@program4_seven_melb_tennis)
      end
    end
    
    context "where there is a valid region and search string" do
      it "returns the programs for that region and search string" do
        Guide.new(@region_melbourne,nil,@search_string).programs_for_html.should include(@program1_nine_melb_cricket)
      end
      
      it "does not return the programs for other regions or search strings" do
        Guide.new(@region_melbourne,nil,@search_string).programs_for_html.should_not include(@program2_nine_bris_cricket, @program3_seven_melb_cricket,@program4_seven_melb_tennis)
      end
    end
  
  end

end
  