class ParentsController < ApplicationController

  before_action :set_student
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  filter_access_to :all

  # GET /parents
  # GET /parents.json
  def index
    @parents = @student.parents
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)
    @parent.student_id = params[:student_id]
    respond_to do |format|
      if @parent.save
        format.html { redirect_to [@student, @parent] , notice: 'Parent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parent }
      else
        format.html { render action: 'new' }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to [@student, @parent] , notice: 'Parent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to [@student, @parent] }
      format.json { head :no_content }
    end
  end

  private

    def set_student
      @student = Student.find(params[:student_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = @student.parents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit!
    end
end
