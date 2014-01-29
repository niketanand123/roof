class RoofTypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_roof_type, only: [:show, :edit, :update, :destroy]

  # GET /roof_types
  # GET /roof_types.json
  def index
    @roof_types = RoofType.all
  end

  # GET /roof_types/1
  # GET /roof_types/1.json
  def show
  end

  # GET /roof_types/new
  def new
    @roof_type = RoofType.new
  end

  # GET /roof_types/1/edit
  def edit
  end

  # POST /roof_types
  # POST /roof_types.json
  def create
    @roof_type = RoofType.new(roof_type_params)

    respond_to do |format|
      if @roof_type.save
        format.html { redirect_to @roof_type, notice: 'Roof type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @roof_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @roof_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roof_types/1
  # PATCH/PUT /roof_types/1.json
  def update
    respond_to do |format|
      if @roof_type.update(roof_type_params)
        format.html { redirect_to @roof_type, notice: 'Roof type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @roof_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roof_types/1
  # DELETE /roof_types/1.json
  def destroy
    respond_to do |format|
      if @roof_type.destroy
        format.html { redirect_to roof_types_url, notice: 'Roof Type was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to roof_types_url, notice: "An Error Occurred! #{@roof_type.errors[:base].to_s}"}
        format.json { head :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roof_type
      @roof_type = RoofType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roof_type_params
      params.require(:roof_type).permit(:roof_type)
    end
end
