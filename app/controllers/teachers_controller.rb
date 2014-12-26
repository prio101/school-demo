class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(permitted_params)

    if @teacher.save
      redirect_to teachers_path, notice: 'Teacher Created'
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  private
    def permitted_params
      params.require(:teacher).permit(:serial, :name, :date_of_birth, :designation, :date_of_joining, :date_of_MPO, :salary_scale_and_grade, :index_number, :mobile, :email, :part_time_or_full_time,
                                      :course_wise_department, :course_wise_department, :department_id)
    end
end
