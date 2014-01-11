class JobEstimateItemsController < ApplicationController
  before_action :set_job_estimate, only: [:show, :edit, :update, :destroy]

  # GET /JobEstimateItems
  # GET /JobEstimateItems.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_estimate_items = JobEstimateItem.order("step asc").where(:job_site_id =>params[:job_site_id])
  end


  def populate_estimate
    if params[:master_item_id].present?
      @assembly = Assembly.find(params[:master_item_id])
    else
      @assembly = nil
    end
    if params[:qty].present?
      @qty = params[:qty]
    else
      @qty = 1
    end
    respond_to do |format|
      format.js
    end
  end
  # GET /JobEstimateItems/1
  # GET /JobEstimateItems/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
  end

  # GET /JobEstimateItems/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate_item = @job_site.job_estimate_items.build(:job_site_id =>@job_site)
  end

  # GET /JobEstimateItems/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
  end

  # POST /JobEstimateItems
  # POST /JobEstimateItems.json
  def create
    @job_site = JobSite.find(params[:job_estimate_item][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate_item = @job_site.job_estimate_items.create(job_estimate_params)

    respond_to do |format|
      if @job_estimate_item.save
        format.html { redirect_to customer_job_site_job_estimates_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job estimate was successfully created.' }
        format.xml  { render :xml => @job_estimate_item, :status => :created, :location => [@job_site, @job_estimate_item] }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_estimate_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /JobEstimateItems/1
  # PATCH/PUT /JobEstimateItems/1.json
  def update
    @job_site = JobSite.find(params[:job_estimate_item][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    respond_to do |format|
      if @job_estimate_item.update_attributes(job_estimate_params)
        format.html { redirect_to customer_job_site_job_estimates_path(:customer_id=>@customer.id, :id=>@job_estimate_item.id,:job_site_id=>@job_estimate_item.job_site_id), notice: 'Job estimate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_estimate_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /JobEstimateItems/1
  # DELETE /JobEstimateItems/1.json
  def destroy
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate_item.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_estimates_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job estimate was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_estimate
      @job_estimate_item = JobEstimateItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_estimate_params
      params.require(:job_estimate_item).permit(:step, :master_item_id, :qty, :proposal_desc, :warranty_desc,
                                           :retail_price, :item_extended) if params[:job_estimate_item]
    end
end
