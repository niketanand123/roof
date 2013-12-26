class UnitOfMeasurementsController < ApplicationController
  before_action :set_unit_of_measurement, only: [:show, :edit, :update, :destroy]

  # GET /unit_of_measurements
  # GET /unit_of_measurements.json
  def index
    @unit_of_measurements = UnitOfMeasurement.all
  end

  # GET /unit_of_measurements/1
  # GET /unit_of_measurements/1.json
  def show
  end

  # GET /unit_of_measurements/new
  def new
    @unit_of_measurement = UnitOfMeasurement.new
  end

  # GET /unit_of_measurements/1/edit
  def edit
  end

  # POST /unit_of_measurements
  # POST /unit_of_measurements.json
  def create
    @unit_of_measurement = UnitOfMeasurement.new(unit_of_measurement_params)

    respond_to do |format|
      if @unit_of_measurement.save
        format.html { redirect_to @unit_of_measurement, notice: 'Unit of measurement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unit_of_measurement }
      else
        format.html { render action: 'new' }
        format.json { render json: @unit_of_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_of_measurements/1
  # PATCH/PUT /unit_of_measurements/1.json
  def update
    respond_to do |format|
      if @unit_of_measurement.update(unit_of_measurement_params)
        format.html { redirect_to @unit_of_measurement, notice: 'Unit of measurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit_of_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_of_measurements/1
  # DELETE /unit_of_measurements/1.json
  def destroy
    @unit_of_measurement.destroy
    respond_to do |format|
      format.html { redirect_to unit_of_measurements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_of_measurement
      @unit_of_measurement = UnitOfMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_of_measurement_params
      params.require(:unit_of_measurement).permit(:unit)
    end
end
