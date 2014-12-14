class BatchesController < ApplicationController

  before_filter :authenticate_user!


  filter_access_to :all

  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json

  add_breadcrumb "Years", :batches_path, :options => { :title => "New Batch" }

  def index
    @batches = Batch.page params[:page]
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    add_breadcrumb "#{@batch.try(:name)}", batch_path(@batch), :options => { :title => "Batch" }
  end

  # GET /batches/new
  def new
    add_breadcrumb "Year/Term", :new_batch_path, :options => { :title => "New Batch" }
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
    add_breadcrumb "#{@batch.try(:name)}", :batches_path, :options => { :title => "Batch" }
    add_breadcrumb "Edit", :new_batch_path, :options => { :title => "New Batch" }
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)
    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @batch }
      else
        flash.now[:error] = @batch.errors.full_messages.join(', ')
        format.html { render action: 'new' }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        flash.now[:error] = @batch.errors.full_messages.join(', ')
        format.html { render action: 'edit' }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      flash.now[:error] = "Batch record deleted"
      format.html { redirect_to batches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit!
    end
end
