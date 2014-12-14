class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(permitted_params)

    if @department.save
      redirect_to departments_path, notice: 'Department Created'
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
      params.require(:department).permit(:name, :code)
    end
end
