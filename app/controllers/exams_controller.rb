class ExamsController < ApplicationController

  before_filter :authenticate_user!

  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exam }
      else
        format.html { render action: 'new' }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete

  end

  def destroy

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exam
    @exam = Exam.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def exam_params
    params.require(:exam).permit(:name, :code, :batch_id)
  end

end
