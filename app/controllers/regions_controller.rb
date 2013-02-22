class RegionsController < ApplicationController
  
  before_filter :authenticate  
  
  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all

    @title = "Regions | Sport on Television in Australia"
    @breadcrumb = "Regions"
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight." 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @region = Region.find(params[:id])

    @title = "Region: " + @region.name + "| Sport on Television in Australia"
    @breadcrumb = "Region: "+ @region.name
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight." 
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @region }
    end
  end
  
  # GET /regions/new
  # GET /regions/new.json
  def new
    @region = Region.new

    @title = "Region | Sport on Television in Australia"
    @breadcrumb = "Region"
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight." 
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: region }
    end
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
    
    @title = "Region: " + @region.name + "| Sport on Television in Australia"
    @breadcrumb = "Region: "+ @region.name
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight." 
    
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(params[:region])

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region @region.name was successfully created.' }
        format.json { render json: @region, status: :created, location: @region }
      else
        format.html { render action: "new" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /regions/1
  # PUT /regions/1.json
  def update
    @region = Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:region])
        format.html { redirect_to @region, notice: 'Region @region.name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region = Region.find(params[:id])
    @region.destroy

    respond_to do |format|
      format.html { redirect_to regions_url }
      format.json { head :no_content }
    end
  end
  
end
