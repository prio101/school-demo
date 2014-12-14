class CourseTimetablesController < ApplicationController
  before_action :set_course_timetable, only: [:show, :edit, :update, :destroy]

  # GET /course_timetables
  # GET /course_timetables.json
  def index
    @course_timetables = CourseTimetable.all
  end

  # GET /course_timetables/1
  # GET /course_timetables/1.json
  def show
  end

  # GET /course_timetables/new
  def new
    @course_timetable = CourseTimetable.new
  end

  # GET /course_timetables/1/edit
  def edit
  end

  # POST /course_timetables
  # POST /course_timetables.json
  def create
    @course_timetable = CourseTimetable.new(course_timetable_params)

    respond_to do |format|
      if @course_timetable.save
        format.html { redirect_to @course_timetable, notice: 'Course timetable was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_timetable }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_timetables/1
  # PATCH/PUT /course_timetables/1.json
  def update
    respond_to do |format|
      if @course_timetable.update(course_timetable_params)
        format.html { redirect_to @course_timetable, notice: 'Course timetable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_timetables/1
  # DELETE /course_timetables/1.json
  def destroy
    @course_timetable.destroy
    respond_to do |format|
      format.html { redirect_to course_timetables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_timetable
      @course_timetable = CourseTimetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_timetable_params
      params[:course_timetable]
    end
end
