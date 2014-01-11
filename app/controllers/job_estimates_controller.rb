class JobEstimatesController < ApplicationController
  before_action :set_job_estimate, only: [:show, :edit, :update, :destroy, :delete_estimate_item]

  # GET /job_estimates
  # GET /job_estimates.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_estimates = JobEstimate.order("updated_at desc").where(:job_site_id =>params[:job_site_id])
  end


  def update_estimate_item
    if params[:id].present? && params[:qty].present?
      @item_id = params[:id]
      @item = JobEstimateItem.find(@item_id)
      @extended_price = @item.assembly.total_price * params[:qty].to_f
      @item.update(:qty => params[:qty], :item_extended =>@extended_price)

    end
    respond_to do |format|
      format.js
    end
  end
  # GET /job_estimates/1
  # GET /job_estimates/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @items = JobEstimateItem.where("job_estimate_id = ?", @job_estimate.id)
    @not_added_job_estimate_items = Assembly.where("id NOT IN (?)", @items.map(&:master_item_id))
  end

  # GET /job_estimates/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate = @job_site.job_estimates.build(:job_site_id =>@job_site)
    @not_added_job_estimate_items = Assembly.order("item_description asc").all
    @job_estimate.name = Time.now.strftime("%m%d%Y%H%M%S")+"_"+@job_site.id.to_s+"_Estimate"
  end

  # GET /job_estimates/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @items = JobEstimateItem.where("job_estimate_id = ?", @job_estimate.id)
    if @items.any?
      @not_added_job_estimate_items = Assembly.where("id NOT IN (?)", @items.map(&:master_item_id))
    else
      @not_added_job_estimate_items = Assembly.all
    end
  end

  def delete_estimate_item
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    JobEstimateItem.find(params[:estimate_item_id]).destroy
    @items = JobEstimateItem.where("job_estimate_id = ?", params[:id])
    @not_added_job_estimate_items = Assembly.where("id NOT IN (?)", @items.map(&:master_item_id))
    update_job_estimate_total_price
    respond_to do |format|
      format.html { redirect_to edit_customer_job_site_job_estimate_path(:customer_id=>@customer.id, :id=>params[:id],:job_site_id=>@job_site.id), notice: 'Item is removed successfully.' }
    end
  end

  # POST /job_estimates
  # POST /job_estimates.json
  def create
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate = @job_site.job_estimates.create(job_estimate_params)
    respond_to do |format|
      if @job_estimate.save
        total_price = insert_estimate_items(@job_estimate.id)
        @job_estimate.update(:total_item_price =>total_price)
        format.html { redirect_to edit_customer_job_site_job_estimate_path(:customer_id=>@customer.id,:job_site_id => @job_site.id,:id =>@job_estimate.id), notice: 'Job estimate was successfully created.' }
        format.xml  { render :xml => @job_estimate, :status => :created, :location => [@job_site, @job_estimate] }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_estimate.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /job_estimates/add_items
  def add_items
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimate = JobEstimate.find(params[:id])
    #update_job_estimate_total_price
    total_price = insert_estimate_items(@job_estimate.id)
    @job_estimate.update(:total_item_price =>total_price)
    respond_to do |format|
        format.html { redirect_to edit_customer_job_site_job_estimate_path(:customer_id=>@customer.id,:job_site_id => @job_site.id,:id =>@job_estimate.id), notice: 'Items are added successfully.' }
    end
  end

  # PATCH/PUT /job_estimates/1
  # PATCH/PUT /job_estimates/1.json
  def update
    if(params[:commit] == "Add Item")
      return add_items
    end
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    update_job_estimate_total_price
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
    params.require(:job_estimate).permit(:name, :total_item_price, :price_adjustment, :reason_desc, :estimate_status_id,
                                         :job_site_id, :item_to_delete_id) if params[:job_estimate]
  end
  def insert_estimate_items (job_estimate_id)
    total_price = @job_estimate.total_item_price
    if params[:selected_assemblies_checkbox] != nil
      params[:selected_assemblies_checkbox].each do |assembly_id|
        @assembly = Assembly.find(assembly_id)
        @job_estimate_item = JobEstimateItem.new("job_estimate_id" => job_estimate_id, "master_item_id" => assembly_id, "qty" => 1, "retail_price" => @assembly.total_price, "item_extended" => @assembly.total_price)
        @job_estimate_item.save
        total_price = total_price + @assembly.total_price
      end
    end
    return total_price
  end
  def update_job_estimate_total_price
    @items = JobEstimateItem.where(:job_estimate_id => @job_estimate.id)
    total_price = 0
    @items.each do |item|
      total_price = total_price+ item.item_extended
    end
    @job_estimate.update(:total_item_price=>total_price)
  end
end
