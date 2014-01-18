class JobCostingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_job_costing, only: [:show, :edit, :update, :destroy]

  # GET /job_costings
  # GET /job_costings.json
  def index
    @job_costings = JobCosting.all
  end

  # GET /job_costings/1
  # GET /job_costings/1.json
  def show
  end

  # GET /job_costings/new
  def new
    @job_costing = JobCosting.new
  end

  # GET /job_costings/1/edit
  def edit
  end

  # POST /job_costings
  # POST /job_costings.json
  def create
    @job_costing = JobCosting.new(job_costing_params)

    respond_to do |format|
      if @job_costing.save
        format.html { redirect_to @job_costing, notice: 'Job costing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_costing }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_costing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_costings/1
  # PATCH/PUT /job_costings/1.json
  def update
    respond_to do |format|
      if @job_costing.update(job_costing_params)
        format.html { redirect_to @job_costing, notice: 'Job costing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_costing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_costings/1
  # DELETE /job_costings/1.json
  def destroy
    @job_costing.destroy
    respond_to do |format|
      format.html { redirect_to job_costings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_costing
      @job_costing = JobCosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_costing_params
      params.require(:job_costing).permit(:job_site_id, :materials, :labor, :job_cost, :overhead, :overhead_percentage, :net_profit)
    end
end
