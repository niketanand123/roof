class JobEstimatesController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_job_estimate, only: [:show, :edit, :update, :destroy, :delete_estimate_item,:job_estimate_pdf, :job_proposal]

  # GET /job_estimates
  # GET /job_estimates.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_estimates = JobEstimate.order("updated_at desc").where(:job_site_id =>params[:job_site_id])
  end


  def job_estimate_pdf
    @job_estimate_items = JobEstimateItem.where("job_estimate_id = ?", @job_estimate.id)
  end

  def job_proposal
    @job_estimate_items = JobEstimateItem.order("step asc").where("job_estimate_id = ?", @job_estimate.id)
  end
  def update_estimate_item
    if params[:id].present? && params[:qty].present?
      @item_id = params[:id]
      @item = JobEstimateItem.find(@item_id)
      @extended_price = @item.assembly.total_price * params[:qty].to_f
      @item.update(:qty => params[:qty], :item_extended =>@extended_price)

    end
    if params[:id].present? && params[:step].present?
      @item_id = params[:id]
      @item = JobEstimateItem.find(@item_id)
      @extended_price = @item.item_extended
      @item.update(:step => params[:step])

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
    @items = JobEstimateItem.joins(:assembly).where("assemblies.id = job_estimate_items.master_item_id and job_estimate_items.job_estimate_id = ?", @job_estimate.id).order("assemblies.item_description ASC")
    if @items.any?
      @not_added_job_estimate_items = Assembly.where("id NOT IN (?)", @items.map(&:master_item_id))
    else
      @not_added_job_estimate_items = Assembly.all
    end
    total_price = calculate_total_item_price (@items)
    @job_estimate.total_item_price = number_with_precision(total_price, :precision => 2)
    if @job_estimate.price_adjustment.nil?
      @job_estimate.contract_price = @job_estimate.total_item_price.to_f.round
      @job_estimate.price_adjustment = number_with_precision(@job_estimate.contract_price.to_f - @job_estimate.total_item_price.to_f , :precision => 2)
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
        total_price = number_with_precision(total_price, :precision => 2)
        contract_price = total_price.to_f.round
        price_adjustment = number_with_precision(contract_price.to_f - total_price.to_f, :precision => 2)
        @job_estimate.update(:total_item_price=>total_price, :contract_price=>contract_price, :price_adjustment=>price_adjustment)
        @job_estimate.total_item_price = total_price
        @job_estimate.contract_price = contract_price
        @job_estimate.price_adjustment = price_adjustment
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
    total_price = number_with_precision(total_price, :precision => 2)
    contract_price = total_price.to_f.round
    price_adjustment = number_with_precision(contract_price.to_f - total_price.to_f, :precision => 2)
    @job_estimate.total_item_price = total_price
    @job_estimate.contract_price = contract_price
    @job_estimate.price_adjustment = price_adjustment
    @job_estimate.update(:total_item_price=>total_price, :contract_price=>contract_price, :price_adjustment=>price_adjustment)

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
        format.html { redirect_to edit_customer_job_site_job_estimate_path(:customer_id=>@customer.id,:job_site_id => @job_site.id,:id =>@job_estimate.id), notice: 'Job estimate was successfully updated.' }
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
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_estimate_params
    params.require(:job_estimate).permit(:name, :total_item_price, :price_adjustment, :reason_desc, :estimate_status_id,
                                         :job_site_id, :item_to_delete_id) if params[:job_estimate]
  end
  def insert_estimate_items (job_estimate_id)
    if @job_estimate.total_item_price.nil?
      total_price = 0
    else
      total_price = @job_estimate.total_item_price
    end
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
    total_price = calculate_total_item_price(@items)
    total_price = number_with_precision(total_price, :precision => 2)
    price_adjustment = number_with_precision(@job_estimate.price_adjustment , :precision => 2)
    contract_price = number_with_precision(total_price.to_f + price_adjustment.to_f , :precision => 2)
    @job_estimate.update(:total_item_price=>total_price, :contract_price=>contract_price, :price_adjustment=>price_adjustment)
  end
  def calculate_total_item_price (items)
    total_price =0
    items.each do |item|
      total_price = total_price + item.item_extended
    end
    return total_price
  end
end
