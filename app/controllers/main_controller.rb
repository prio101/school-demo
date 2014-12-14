class MainController < ApplicationController



  before_filter :authenticate_user!


  def home
    if !current_user.try(:student).nil?
      @student_balances = current_user.student.student_balances rescue []
      render :student_balance_information and return
    end

  end

  def student_balance_information
  end
end
