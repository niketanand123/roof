class JobChangeOrdersController < ApplicationController
  #load_and_authorize_resource
  before_action :set_job_change_order, only: [:show, :edit, :update, :destroy]

  # GET /job_change_orders
  # GET /job_change_orders.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_change_orders = JobChangeOrder.where(:job_site_id =>params[:job_site_id])
  end

  # GET /job_change_orders/1
  # GET /job_change_orders/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
  end

  # GET /job_change_orders/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_change_order = @job_site.job_change_orders.build(:job_site_id =>@job_site)
  end

  # GET /job_change_orders/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
  end

  # POST /job_change_orders
  # POST /job_change_orders.json
  def create
    @job_site = JobSite.find(params[:job_change_order][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_change_order = @job_site.job_change_orders.create(job_change_order_params)
    respond_to do |format|
      if @job_change_order.save
        format.html { redirect_to customer_job_site_job_change_orders_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Change Order was successfully created.' }
        format.xml  { render :xml => @job_change_order, :status => :created, :location => [@job_site, @job_change_order] }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_change_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_change_orders/1
  # PATCH/PUT /job_change_orders/1.json
  def update
    @job_site = JobSite.find(params[:job_change_order][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)

    respond_to do |format|
      if @job_change_order.update_attributes(job_change_order_params)
        format.html { redirect_to customer_job_site_job_change_orders_path(:customer_id=>@customer.id, :id=>@job_change_order.id,:job_site_id=>@job_change_order.job_site_id), notice: 'Job Change Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_change_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_change_orders/1
  # DELETE /job_change_orders/1.json
  def destroy
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_change_order.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_change_orders_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Change Order was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_change_order
      @job_change_order = JobChangeOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_change_order_params
      params.require(:job_change_order).permit(:job_site_id, :co_number, :co_total, :notes)
    end
end
