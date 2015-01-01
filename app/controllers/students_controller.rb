class StudentsController < ApplicationController

  require 'roo/excel'


  before_filter :authenticate_user!


  before_action :set_student, only: [:show, :edit, :update, :destroy, :assign_subjects]

  filter_access_to :all

  add_breadcrumb "Students", :dashboard_students_path, :options => {:title => "Students Dashboard"}

  def import
    if request.post?
      @response = Student.import(params[:file])
      redirect_to students_url, notice: "Products imported." and return
    end
  end


  # GET /students
  # GET /students.json
  def dashboard

  end

  def defaulters
    add_breadcrumb "Defaulters", :students_path, :options => {:title => "Students"}
    @batch = params[:batch_id].present? ? Batch.find(params[:batch_id]) : Batch.first
    @students = Student.defaulter(@batch.defaulter_amount).page params[:page]
  end

  def index
    permitted_to? :manage, :students do
      add_breadcrumb "Students", :students_path, :options => {:title => "Students"}
    end
    if params[:batch_id].present?
      @batch = Batch.find(params[:batch_id])
      @course = Course.find(params[:course_id])
      @students = Student.where(batch_id: @batch.id, course_id: @course.id).order(:admission_number => :asc).page params[:page]
    else
      @students = Student.order(:admission_number => :asc).page params[:page]
    end

  end

  # GET /students/1
  # GET /students/1.json
  def show
    if current_user.student?
      if current_user.student.id != @student.id
        redirect_to main_home_path, alert: "You are not authorized!"
      end
    end
    @assigned_subjects = @student.subjects
  end

  # GET /students/new
  def new
    add_breadcrumb "New Student", :new_student_path, :options => {:title => "New Students"}

    @student = Student.new
    @student.parents.build
    @student_count = Student.count
    @last_student = Student.last
  end

  # GET /students/1/edit
  def edit
    add_breadcrumb "Edit Student", :edit_student_path, :options => {:title => "Edit Students"}
    redirect_to main_home_path, alert: "You are not authorized!" if current_user.student?
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        flash.now[:error] = @student.errors.full_messages.join(', ')
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to request.referer, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        flash.now[:error] = @student.errors.full_messages.join(', ')
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      flash.now[:error] = "Student record deleted"
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  def assign_subjects
    @student = Student.find(params[:id])
    @assigned_subjects = @student.subjects
    @subjects = Subject.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit!
  end
end
