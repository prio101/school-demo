class FeeCategoriesController < ApplicationController

  before_filter :authenticate_user!


  before_action :set_fee_category, only: [:show, :edit, :update, :destroy]

  # GET /fee_categories
  # GET /fee_categories.json
  def index
    add_breadcrumb "School Fee", :fee_categories_path, :options => {:title => "School Fee"}
    @fee_categories = FeeCategory.page params[:page]
  end

  # GET /fee_categories/1
  # GET /fee_categories/1.json
  def show
  end

  # GET /fee_categories/new
  def new
    add_breadcrumb "New School Fee", :new_fee_category_path, :options => {:title => "New School Fee"}
    @fee_category = FeeCategory.new
  end

  # GET /fee_categories/1/edit
  def edit
  end

  # POST /fee_categories
  # POST /fee_categories.json
  def create
    @fee_category = FeeCategory.new(fee_category_params)

    respond_to do |format|
      if @fee_category.save
        format.html { redirect_to @fee_category, notice: 'Fee category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fee_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @fee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_categories/1
  # PATCH/PUT /fee_categories/1.json
  def update
    respond_to do |format|
      if @fee_category.update(fee_category_params)
        format.html { redirect_to @fee_category, notice: 'Fee category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_categories/1
  # DELETE /fee_categories/1.json
  def destroy
    @fee_category.destroy
    respond_to do |format|
      format.html { redirect_to fee_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_category
      @fee_category = FeeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_category_params
      params.require(:fee_category).permit!
    end
end
