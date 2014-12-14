class GovernmentSalariesController < ApplicationController
  def index
    @government_salaries = GovernmentSalary.all
  end

  def new
    @government_salary = GovernmentSalary.new
  end

  def create
    @government_salary = GovernmentSalary.new(permitted_params)

    if @government_salary.save
      redirect_to government_salaries_path, notice: 'Salary Created'
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
    params.require(:government_salary).permit(:teacher_id, :bank_no, :pay_scale_code,
                                              :pay_scale_accomodation_medical, :incrementt, :total,
                                              :welfare_reduction, :retirement_reduction, :total_reduction,
                                              :total_received)
  end
end
