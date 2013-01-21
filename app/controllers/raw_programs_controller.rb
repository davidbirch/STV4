class RawProgramsController < ApplicationController
  # GET /raw_programs
  # GET /raw_programs.json
  def index
    @raw_programs = RawProgram.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_programs }
    end
  end

  # GET /raw_programs/1
  # GET /raw_programs/1.json
  def show
    @raw_program = RawProgram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_program }
    end
  end

  # GET /raw_programs/new
  # GET /raw_programs/new.json
  def new
    @raw_program = RawProgram.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_program }
    end
  end

  # GET /raw_programs/1/edit
  def edit
    @raw_program = RawProgram.find(params[:id])
  end

  # POST /raw_programs
  # POST /raw_programs.json
  def create
    @raw_program = RawProgram.new(params[:raw_program])

    respond_to do |format|
      if @raw_program.save
        format.html { redirect_to @raw_program, notice: 'Raw program was successfully created.' }
        format.json { render json: @raw_program, status: :created, location: @raw_program }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_programs/1
  # PUT /raw_programs/1.json
  def update
    @raw_program = RawProgram.find(params[:id])

    respond_to do |format|
      if @raw_program.update_attributes(params[:raw_program])
        format.html { redirect_to @raw_program, notice: 'Raw program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_programs/1
  # DELETE /raw_programs/1.json
  def destroy
    @raw_program = RawProgram.find(params[:id])
    @raw_program.destroy

    respond_to do |format|
      format.html { redirect_to raw_programs_url }
      format.json { head :no_content }
    end
  end
end
