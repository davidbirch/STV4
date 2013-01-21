class RawChannelsController < ApplicationController
  # GET /raw_channels
  # GET /raw_channels.json
  def index
    @raw_channels = RawChannel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_channels }
    end
  end

  # GET /raw_channels/1
  # GET /raw_channels/1.json
  def show
    @raw_channel = RawChannel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_channel }
    end
  end

  # GET /raw_channels/new
  # GET /raw_channels/new.json
  def new
    @raw_channel = RawChannel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_channel }
    end
  end

  # GET /raw_channels/1/edit
  def edit
    @raw_channel = RawChannel.find(params[:id])
  end

  # POST /raw_channels
  # POST /raw_channels.json
  def create
    @raw_channel = RawChannel.new(params[:raw_channel])

    respond_to do |format|
      if @raw_channel.save
        format.html { redirect_to @raw_channel, notice: 'Raw channel was successfully created.' }
        format.json { render json: @raw_channel, status: :created, location: @raw_channel }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_channels/1
  # PUT /raw_channels/1.json
  def update
    @raw_channel = RawChannel.find(params[:id])

    respond_to do |format|
      if @raw_channel.update_attributes(params[:raw_channel])
        format.html { redirect_to @raw_channel, notice: 'Raw channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_channels/1
  # DELETE /raw_channels/1.json
  def destroy
    @raw_channel = RawChannel.find(params[:id])
    @raw_channel.destroy

    respond_to do |format|
      format.html { redirect_to raw_channels_url }
      format.json { head :no_content }
    end
  end
end
