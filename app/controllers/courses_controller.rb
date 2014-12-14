class CoursesController < ApplicationController

  before_filter :authenticate_user!

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  filter_access_to :all

  # GET /courses
  # GET /courses.json

  add_breadcrumb "Courses", :courses_path, :options => { :title => "courses" }

  def index
    @courses = Course.page params[:page]
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    add_breadcrumb "#{@course.try(:name)}", course_path(@course), :options => { :title => "courses" }
  end

  # GET /courses/new
  def new
    add_breadcrumb "New Courses", new_course_path, :options => { :title => "courses" }
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb "Edit #{@course.try(:name)}", course_path(@course), :options => { :title => "courses" }
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        raise @course.errors.inspect
        flash.now[:notice] = @course.errors.full_messages.join(', ')
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        flash.now[:error] = @course.errors.full_messages.join(', ')
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      if @course.student_count
        flash[:notice] = "This course has student(s). You can't delete this course!"
      end
      flash.now[:error] = "Course record deleted"
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit!
    end
end
