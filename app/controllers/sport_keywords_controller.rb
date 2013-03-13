class SportKeywordsController < ApplicationController
  
  force_ssl
  before_filter :authenticate
    
  # GET /sport_keywords
  # GET /sport_keywords.json
  def index
    @sport_keywords = SportKeyword.order("priority DESC, value_length DESC").all
    
    @title = "Sport Keywords | Sport on Television in Australia"
    @breadcrumb = "Sport Keywords"
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight." 

    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sport_keywords }
    end
  end

  # GET /sport_keywords/1
  # GET /sport_keywords/1.json
  def show
    @sport_keyword = SportKeyword.find(params[:id])

    @title = "Sport Keyword: " + @sport_keyword.value + " | Sport on Television in Australia"
    @breadcrumb = "Sport: "+ @sport_keyword.value
    @meta_keywords = "sport, television, tv, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your source for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight." 


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sport_keyword }
    end
  end

  # GET /sport_keywords/new
  # GET /sport_keywords/new.json
  def new
    @sport_keyword = SportKeyword.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sport_keyword }
    end
  end

  # GET /sport_keywords/1/edit
  def edit
    @sport_keyword = SportKeyword.find(params[:id])
  end

  # POST /sport_keywords
  # POST /sport_keywords.json
  def create
    @sport_keyword = SportKeyword.new(params[:sport_keyword])

    respond_to do |format|
      if @sport_keyword.save
        format.html { redirect_to @sport_keyword, notice: 'Sport keyword was successfully created.' }
        format.json { render json: @sport_keyword, status: :created, location: @sport_keyword }
      else
        format.html { render action: "new" }
        format.json { render json: @sport_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sport_keywords/1
  # PUT /sport_keywords/1.json
  def update
    @sport_keyword = SportKeyword.find(params[:id])

    respond_to do |format|
      if @sport_keyword.update_attributes(params[:sport_keyword])
        format.html { redirect_to @sport_keyword, notice: 'Sport keyword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sport_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_keywords/1
  # DELETE /sport_keywords/1.json
  def destroy
    @sport_keyword = SportKeyword.find(params[:id])
    @sport_keyword.destroy

    respond_to do |format|
      format.html { redirect_to sport_keywords_url }
      format.json { head :no_content }
    end
  end
end
