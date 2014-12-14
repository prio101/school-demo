class StudentBalancesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_student

  filter_access_to :all


  before_action :set_student_balance, only: [:show, :edit, :update, :destroy]

  # GET /student_balances
  # GET /student_balances.json
  def index
    @student_balances = StudentBalance.of(student_param).page params[:page]
  end

  # GET /student_balances/1
  # GET /student_balances/1.json
  def show
  end

  # GET /student_balances/new
  def new
    @student_balance = @student.student_balances.new
  end

  # GET /student_balances/1/edit
  def edit

  end

  # POST /student_balances
  # POST /student_balances.json
  def create
    @student_balance = @student.student_balances.new(student_balance_params)

    respond_to do |format|
      if @student_balance.save
        format.html { redirect_to [@student, @student_balance], notice: 'Student balance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student_balance }
      else
        raise @student_balance.errors.inspect
        format.html { render action: 'new' }
        format.json { render json: @student_balance.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /student_balances/1
  # PATCH/PUT /student_balances/1.json
  def update
    respond_to do |format|
      if @student_balance.update(student_balance_params)
        format.html { redirect_to [@student, @student_balance], notice: 'Student balance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_balances/1
  # DELETE /student_balances/1.json
  def destroy
    @student_balance.destroy
    respond_to do |format|
      format.html { redirect_to student_student_balances_url(params[:student_id]) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student_balance
    @student_balance = StudentBalance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_balance_params
      params.require(:student_balance).permit!
  end

  def student_param
    params[:student_id]
  end


  def get_student
    @student = Student.find(params[:student_id])
  end
end
