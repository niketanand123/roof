class JobEstimatesController < ApplicationController
  before_action :set_job_estimate, only: [:show, :edit, :update, :destroy]

  # GET /job_estimates
  # GET /job_estimates.json
  def index
    @job_estimates = JobEstimate.all
  end

  # GET /job_estimates/1
  # GET /job_estimates/1.json
  def show
  end

  # GET /job_estimates/new
  def new
    @job_estimate = JobEstimate.new
  end

  # GET /job_estimates/1/edit
  def edit
  end

  # POST /job_estimates
  # POST /job_estimates.json
  def create
    @job_estimate = JobEstimate.new(job_estimate_params)

    respond_to do |format|
      if @job_estimate.save
        format.html { redirect_to @job_estimate, notice: 'Job estimate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_estimate }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_estimates/1
  # PATCH/PUT /job_estimates/1.json
  def update
    respond_to do |format|
      if @job_estimate.update(job_estimate_params)
        format.html { redirect_to @job_estimate, notice: 'Job estimate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_estimates/1
  # DELETE /job_estimates/1.json
  def destroy
    @job_estimate.destroy
    respond_to do |format|
      format.html { redirect_to job_estimates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_estimate
      @job_estimate = JobEstimate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_estimate_params
      params.require(:job_estimate).permit(:job_detail_id, :step, :master_item_id, :qty, :proposal_desc, :warranty_desc, :retail_price, :item_extended)
    end
end
