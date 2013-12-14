class JobChangeOrdersController < ApplicationController
  before_action :set_job_change_order, only: [:show, :edit, :update, :destroy]

  # GET /job_change_orders
  # GET /job_change_orders.json
  def index
    @job_change_orders = JobChangeOrder.all
  end

  # GET /job_change_orders/1
  # GET /job_change_orders/1.json
  def show
  end

  # GET /job_change_orders/new
  def new
    @job_change_order = JobChangeOrder.new
  end

  # GET /job_change_orders/1/edit
  def edit
  end

  # POST /job_change_orders
  # POST /job_change_orders.json
  def create
    @job_change_order = JobChangeOrder.new(job_change_order_params)

    respond_to do |format|
      if @job_change_order.save
        format.html { redirect_to @job_change_order, notice: 'Job change order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_change_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_change_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_change_orders/1
  # PATCH/PUT /job_change_orders/1.json
  def update
    respond_to do |format|
      if @job_change_order.update(job_change_order_params)
        format.html { redirect_to @job_change_order, notice: 'Job change order was successfully updated.' }
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
    @job_change_order.destroy
    respond_to do |format|
      format.html { redirect_to job_change_orders_url }
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
