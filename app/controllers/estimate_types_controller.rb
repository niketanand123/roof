class EstimateTypesController < ApplicationController
  before_action :set_estimate_type, only: [:show, :edit, :update, :destroy]

  # GET /estimate_types
  # GET /estimate_types.json
  def index
    @estimate_types = EstimateType.all
  end

  # GET /estimate_types/1
  # GET /estimate_types/1.json
  def show
  end

  # GET /estimate_types/new
  def new
    @estimate_type = EstimateType.new
  end

  # GET /estimate_types/1/edit
  def edit
  end

  # POST /estimate_types
  # POST /estimate_types.json
  def create
    @estimate_type = EstimateType.new(estimate_type_params)

    respond_to do |format|
      if @estimate_type.save
        format.html { redirect_to @estimate_type, notice: 'Estimate type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estimate_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @estimate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimate_types/1
  # PATCH/PUT /estimate_types/1.json
  def update
    respond_to do |format|
      if @estimate_type.update(estimate_type_params)
        format.html { redirect_to @estimate_type, notice: 'Estimate type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estimate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimate_types/1
  # DELETE /estimate_types/1.json
  def destroy
    @estimate_type.destroy
    respond_to do |format|
      format.html { redirect_to estimate_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate_type
      @estimate_type = EstimateType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimate_type_params
      params.require(:estimate_type).permit(:estimate_type, :default_overhead)
    end
end
