class JobEstimatesController < ApplicationController
  before_action :set_job_estimate, only: [:show, :edit, :update, :destroy]

  # GET /job_estimates
  # GET /job_estimates.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_estimates = JobEstimate.where(:job_site_id =>params[:job_site_id])
  end

  # GET /job_estimates/1
  # GET /job_estimates/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    #@job_estimate = JobEstimate.find(params[:id])
  end

  # GET /job_estimates/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate = @job_site.job_estimates.build(:job_site_id =>@job_site)
  end

  # GET /job_estimates/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    #@job_estimate = JobEstimate.find(params[:id])
  end

  # POST /job_estimates
  # POST /job_estimates.json
  def create
    @job_site = JobSite.find(params[:job_estimate][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate = @job_site.job_estimates.create(job_estimate_params)

    respond_to do |format|
      if @job_estimate.save
        format.html { redirect_to customer_job_site_job_estimates_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job estimate was successfully created.' }
        format.xml  { render :xml => @job_estimate, :status => :created, :location => [@job_site, @job_estimate] }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_estimates/1
  # PATCH/PUT /job_estimates/1.json
  def update
    @job_site = JobSite.find(params[:job_estimate][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    respond_to do |format|
      if @job_estimate.update_attributes(job_estimate_params)
        format.html { redirect_to customer_job_site_job_estimates_path(:customer_id=>@customer.id, :id=>@job_estimate.id,:job_site_id=>@job_estimate.job_site_id), notice: 'Job estimate was successfully updated.' }
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
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_estimates_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job estimate was successfully deleted.' }
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
      params.require(:job_estimate).permit(:step, :master_item_id, :qty, :proposal_desc, :warranty_desc,
                                           :retail_price, :item_extended) if params[:job_estimate]
    end
end
