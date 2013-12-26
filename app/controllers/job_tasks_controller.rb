class JobTasksController < ApplicationController
  before_action :set_job_task, only: [:show, :edit, :update, :destroy]

  # GET /job_tasks
  # GET /job_tasks.json
  def index_all
    @job_tasks = JobTask.order("id desc").all
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_tasks = JobTask.where(:job_site_id =>params[:job_site_id])
  end

  # GET /job_tasks/1
  # GET /job_tasks/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    format_dates
  end

  # GET /job_tasks/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_task = @job_site.job_tasks.build(:job_site_id =>@job_site)
  end

  # GET /job_tasks/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    format_dates
  end

  # POST /job_tasks
  # POST /job_tasks.json
  def create
    @job_site = JobSite.find(params[:job_task][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_task = @job_site.job_tasks.create(job_task_params)
    format_dates_before_insert_or_update
    respond_to do |format|
      if @job_task.save
        format.html { redirect_to customer_job_site_job_tasks_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Task was successfully created.' }
        format.xml  { render :xml => @job_task, :status => :created, :location => [@job_site, @job_task] }
      else
        format_dates
        format.html { render action: 'new' }
        format.json { render json: @job_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_tasks/1
  # PATCH/PUT /job_tasks/1.json
  def update
    @job_site = JobSite.find(params[:job_task][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    format_dates_before_insert_or_update
    respond_to do |format|
      if @job_task.update_attributes(job_task_params)
        format.html { redirect_to customer_job_site_job_tasks_path(:customer_id=>@customer.id, :id=>@job_task.id,:job_site_id=>@job_task.job_site_id), notice: 'Job Task was successfully updated.' }
        format.json { head :no_content }
      else
        format_dates
        format.html { render action: 'edit' }
        format.json { render json: @job_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_tasks/1
  # DELETE /job_tasks/1.json
  def destroy
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_task.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_tasks_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_task
      @job_task = JobTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_task_params
      params.require(:job_task).permit(:job_site_id, :task_type_id, :task_note, :unformatted_target_date, :entered_by_id, :unformatted_date_completed, :completed_by_id)  if params[:job_task]
    end

    def get_date(date)
      if date != nil && date != ""
        formatDate = Time.strptime(date, "%m/%d/%Y")
      end
    end
    def format_dates
      if(@job_task.target_date !=nil)
        @job_task.unformatted_target_date = @job_task.target_date.strftime("%m/%d/%Y")
      end
      if(@job_task.date_completed !=nil)
        @job_task.unformatted_date_completed = @job_task.date_completed.strftime("%m/%d/%Y")
      end
    end

    def format_dates_before_insert_or_update
      @job_task.unformatted_target_date = params[:job_task][:unformatted_target_date]
      @job_task.unformatted_date_completed = params[:job_task][:unformatted_date_completed]
    end
end
