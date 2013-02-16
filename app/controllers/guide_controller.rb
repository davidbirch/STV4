class GuideController < ApplicationController
    
  # GET /
  def index
    @title = "Sport on Television in Australia"
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."
    
  end

  # GET /[region]
  # GET /[region]/[sport]
  def show
    
    @region = Region.find_by_name(params[:region_name])
    @sport = Sport.find_by_name(params[:sport_name])
    
    unless @region.nil?
      @programs = Guide.new(@region,@sport).programs_for_html
    end
    
    
    @title = "Sport on Television in Australia"
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."
      
  end
end
