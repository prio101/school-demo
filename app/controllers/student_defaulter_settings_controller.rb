class StudentDefaulterSettingsController < ApplicationController
  before_action :set_student_defaulter_setting, only: [:show, :edit, :update, :destroy]

  # GET /student_defaulter_settings
  # GET /student_defaulter_settings.json
  def index
    @student_defaulter_settings = StudentDefaulterSetting.all
  end

  # GET /student_defaulter_settings/1
  # GET /student_defaulter_settings/1.json
  def show
  end

  # GET /student_defaulter_settings/new
  def new
    @student_defaulter_setting = StudentDefaulterSetting.new
  end

  # GET /student_defaulter_settings/1/edit
  def edit
  end

  # POST /student_defaulter_settings
  # POST /student_defaulter_settings.json
  def create
    @student_defaulter_setting = StudentDefaulterSetting.new(student_defaulter_setting_params)

    respond_to do |format|
      if @student_defaulter_setting.save
        format.html { redirect_to @student_defaulter_setting, notice: 'Student defaulter setting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student_defaulter_setting }
      else
        format.html { render action: 'new' }
        format.json { render json: @student_defaulter_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_defaulter_settings/1
  # PATCH/PUT /student_defaulter_settings/1.json
  def update
    respond_to do |format|
      if @student_defaulter_setting.update(student_defaulter_setting_params)
        format.html { redirect_to @student_defaulter_setting, notice: 'Student defaulter setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student_defaulter_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_defaulter_settings/1
  # DELETE /student_defaulter_settings/1.json
  def destroy
    @student_defaulter_setting.destroy
    respond_to do |format|
      format.html { redirect_to student_defaulter_settings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_defaulter_setting
      @student_defaulter_setting = StudentDefaulterSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_defaulter_setting_params
      params.require(:student_defaulter_setting).permit!
    end
end
