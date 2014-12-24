class ResultsController < ApplicationController

  before_action :set_result, only: [:show, :edit, :delete]
  before_filter :authenticate_user!
  before_filter :set_student

  def index
    @results = Result.where(student_id: @student.id)
  end

  def show

  end

  def new
    @result = @student.results.new
  end

  def create
    @result = @student.results.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to [@student, @result], notice: 'Student result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @result }
      else
        raise @result.errors.inspect
        format.html { render action: 'new' }
        format.json { render json: @result.errors, status: :unprocessable_entity }

      end
    end
  end

  def edit

  end

  def update

  end

  def delete
    @result = Result.find_by_student_id(@student.id)
  end

  def destroy
    @result = Result.find_by_student_id(@student.id)
    @result.destroy
    respond_to do |format|
      flash.now[:error] = "Result record deleted"
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private

  def set_student
    if params[:student_id].blank?
      respond_to do |format|
        format.html {redirect_to request.referer , notice: 'You have to provide student id.'}
      end
    end
    @student = Student.find(params[:student_id])
  end

  def set_result
    @result = Result.find(params['id'])
  end

  def result_params
    params.require(:result).permit!
  end

end
