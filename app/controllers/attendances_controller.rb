class AttendancesController < ApplicationController


#   skip_before_filter :verify_authenticity_token
#   before_filter :cors_preflight_check
#   after_filter :cors_set_access_control_headers
# # For all responses in this controller, return the CORS access control headers.
#   def cors_set_access_control_headers
#     headers['Access-Control-Allow-Origin'] = '*'
#     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#     headers['Access-Control-Max-Age'] = "1728000"
#   end
# # If this is a preflight OPTIONS request, then short-circuit the
# # request, return only the necessary headers and return an empty
# # text/plain.
#   def cors_preflight_check
#     headers['Access-Control-Allow-Origin'] = '*'
#     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
#     headers['Access-Control-Max-Age'] = '1728000'
#   end

  def index
    @attendances = Attendance.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @attendance = Attendance.find(params[:id])
  end

  # GET /parents/new
  def new
    @attendance = Attendance.new
  end

  # GET /parents/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /parents
  # POST /parents.json
  def create
    @attendance = Attendance.create!(attendance_params)
    respond_to :js
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    @attendance = Attendance.find(params[:id])
    @attendance.toggle!(:active)
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    Attendance.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  # def manual_attendance
  #   @students = Student.all
  # end
  #
  # def create_mass_attendance
  #
  # end

  private

  def attendance_params

    params.require(:attendance).permit!

  end

end
