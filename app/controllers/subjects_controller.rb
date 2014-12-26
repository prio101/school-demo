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
    @subject = Subject.find(params[:id])
  end

  # POST /parents
  # POST /parents.json
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = 'Subject was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end

  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(notice_params)
      flash[:subject] = 'Notice was successfully updated.'
      redirect_to :action => 'show', :id => @subject
    else
      render :action => 'edit'
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    Subject.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private

  def subject_params

    params.require(:subject).permit!

  end

end
