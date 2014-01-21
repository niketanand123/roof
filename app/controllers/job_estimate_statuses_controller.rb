class JobEstimateStatusesController < ApplicationController
  #load_and_authorize_resource
  before_action :set_job_estimate_status, only: [:show, :edit, :update, :destroy]

  # GET /job_estimate_statuses
  # GET /job_estimate_statuses.json
  def index
    @job_estimate_statuses = JobEstimateStatus.all
  end

  # GET /job_estimate_statuses/1
  # GET /job_estimate_statuses/1.json
  def show
  end

  # GET /job_estimate_statuses/new
  def new
    @job_estimate_status = JobEstimateStatus.new
  end

  # GET /job_estimate_statuses/1/edit
  def edit
  end

  # POST /job_estimate_statuses
  # POST /job_estimate_statuses.json
  def create
    @job_estimate_status = JobEstimateStatus.new(job_estimate_status_params)

    respond_to do |format|
      if @job_estimate_status.save
        format.html { redirect_to @job_estimate_status, notice: 'Job estimate status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_estimate_status }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_estimate_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_estimate_statuses/1
  # PATCH/PUT /job_estimate_statuses/1.json
  def update
    respond_to do |format|
      if @job_estimate_status.update(job_estimate_status_params)
        format.html { redirect_to @job_estimate_status, notice: 'Job estimate status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_estimate_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_estimate_statuses/1
  # DELETE /job_estimate_statuses/1.json
  def destroy
    @job_estimate_status.destroy
    respond_to do |format|
      format.html { redirect_to job_estimate_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_estimate_status
      @job_estimate_status = JobEstimateStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_estimate_status_params
      params.require(:job_estimate_status).permit(:status)
    end
end
