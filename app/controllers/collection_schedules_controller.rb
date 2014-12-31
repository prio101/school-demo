class CollectionSchedulesController < ApplicationController
  before_action :set_collection_schedule, only: [:show, :edit, :update, :destroy]

  # GET /collection_schedules
  # GET /collection_schedules.json
  before_filter :authenticate_user!
  filter_access_to :all
  def index
    add_breadcrumb "Fee Collection", :collection_schedules_path, :options => {:title => "Fee Collection"}
    @collection_schedules = CollectionSchedule.page params[:page]
  end

  # GET /collection_schedules/1
  # GET /collection_schedules/1.json
  def show
  end

  # GET /collection_schedules/new
  def new
    add_breadcrumb "New Fee Collection", :new_collection_schedule_path, :options => {:title => "New Fee Collection"}
    @collection_schedule = CollectionSchedule.new
  end

  # GET /collection_schedules/1/edit
  def edit
  end

  # POST /collection_schedules
  # POST /collection_schedules.json
  def create
    @collection_schedule = CollectionSchedule.new(collection_schedule_params)

    respond_to do |format|
      if @collection_schedule.save
        format.html { redirect_to @collection_schedule, notice: 'Collection schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @collection_schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @collection_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_schedules/1
  # PATCH/PUT /collection_schedules/1.json
  def update
    respond_to do |format|
      if @collection_schedule.update(collection_schedule_params)
        format.html { redirect_to @collection_schedule, notice: 'Collection schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @collection_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_schedules/1
  # DELETE /collection_schedules/1.json
  def destroy
    @collection_schedule.destroy
    respond_to do |format|
      format.html { redirect_to collection_schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_schedule
      @collection_schedule = CollectionSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_schedule_params
      params.require(:collection_schedule).permit!
    end
end
