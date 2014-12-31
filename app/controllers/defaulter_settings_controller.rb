class DefaulterSettingsController < ApplicationController
  before_action :set_defaulter_setting, only: [:show, :edit, :update, :destroy]

  # GET /defaulter_settings
  # GET /defaulter_settings.json
  before_filter :authenticate_user!
  filter_access_to :all
  def index
    @defaulter_settings = DefaulterSetting.all
  end

  # GET /defaulter_settings/1
  # GET /defaulter_settings/1.json
  def show
  end

  # GET /defaulter_settings/new
  def new
    @defaulter_setting = DefaulterSetting.new
  end

  # GET /defaulter_settings/1/edit
  def edit
  end

  # POST /defaulter_settings
  # POST /defaulter_settings.json
  def create
    @defaulter_setting = DefaulterSetting.new(defaulter_setting_params)

    respond_to do |format|
      if @defaulter_setting.save
        format.html { redirect_to @defaulter_setting, notice: 'Defaulter setting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @defaulter_setting }
      else
        format.html { render action: 'new' }
        format.json { render json: @defaulter_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /defaulter_settings/1
  # PATCH/PUT /defaulter_settings/1.json
  def update
    respond_to do |format|
      if @defaulter_setting.update(defaulter_setting_params)
        format.html { redirect_to @defaulter_setting, notice: 'Defaulter setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @defaulter_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defaulter_settings/1
  # DELETE /defaulter_settings/1.json
  def destroy
    @defaulter_setting.destroy
    respond_to do |format|
      format.html { redirect_to defaulter_settings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defaulter_setting
      @defaulter_setting = DefaulterSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def defaulter_setting_params
      params.require(:defaulter_setting).permit(:name, :amount, :batch_id, :current)
    end
end
