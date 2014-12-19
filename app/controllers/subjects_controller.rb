class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @subject = Subject.find(params[:id])
  end

  # GET /parents/new
  def new
    @subject = Subject.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
  end

end
