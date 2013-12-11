class JobDetailsController < ApplicationController
  before_action :set_job_detail, only: [:show, :edit, :update, :destroy]

  # GET /job_details
  # GET /job_details.json
  def index
    @job_details = JobDetail.all
  end

  # GET /job_details/1
  # GET /job_details/1.json
  def show
    @service_types = ServiceType.all
  end

  # GET /job_details/new
  def new
    @job_detail = JobDetail.new
  end

  # GET /job_details/1/edit
  def edit
    @service_types = ServiceType.all
    @job_service_types = JobServiceType.where("job_detail_id" =>@job_detail.id)
    @service_type_ids = @job_service_types.collect{|p| p.service_type_id}
  end

  # POST /job_details
  # POST /job_details.json
  def create
    @job_detail = JobDetail.new(job_detail_params)

    respond_to do |format|
      if @job_detail.save
        job_service_type_save
        format.html { redirect_to @job_detail, notice: 'Job detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_details/1
  # PATCH/PUT /job_details/1.json
  def update
    respond_to do |format|
      if @job_detail.update(job_detail_params)
        job_service_type_update
        format.html { redirect_to @job_detail, notice: 'Job detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_details/1
  # DELETE /job_details/1.json
  def destroy
    @job_detail.destroy
    respond_to do |format|
      format.html { redirect_to job_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_detail
      @job_detail = JobDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_detail_params
      params.require(:job_detail).permit(:job_start_date, :job_status_id, :how_many_stories, :existing_roof_type_id, :new_roof_type_id, :product_type_id, :product_color_id, :sales_rep_id, :estimate_type_id, :contract_price, :deposit_due, :deposit_method, :date_completed, :job_notes, :lead_sheet_note, :info_taken_by_id, :assign_to_id, :date_taken)if params[:job_detail]
    end

    def job_service_type_save
      params[:service_types_checkbox].each do |check|
        service_type_id_value = check
        @job_service_type = JobServiceType.new("job_detail_id" =>@job_detail.id, "service_type_id"=>service_type_id_value)
        @job_service_type.save
      end
    end
    def job_service_type_update
      @job_service_types = JobServiceType.where("job_detail_id" =>@job_detail.id)
      if @job_service_types != nil
        @job_service_types.destroy_all
      end
      params[:service_types_checkbox].each do |check|
         @job_service_type = JobServiceType.new("job_detail_id" =>@job_detail.id, "service_type_id"=>check.to_f)
         @job_service_type.save
      end
    end
end
