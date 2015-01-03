class MainController < ApplicationController



  before_filter :authenticate_user!


  def home
    # if !current_user.try(:student).nil?
    #   @student_balances = current_user.student.student_balances rescue []
    #   render :student_balance_information and return
    # end
    if !current_user.try(:student).nil?
      @student = Student.find(current_user.student.id)
      redirect_to student_path(@student)
    end

  end

  def student_balance_information
  end
end
