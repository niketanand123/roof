class JobTasksController < ApplicationController
  before_action :set_job_task, only: [:show, :edit, :update, :destroy]

  # GET /job_tasks
  # GET /job_tasks.json
  def index
    @job_tasks = JobTask.all
  end

  # GET /job_tasks/1
  # GET /job_tasks/1.json
  def show
  end

  # GET /job_tasks/new
  def new
    @job_task = JobTask.new
  end

  # GET /job_tasks/1/edit
  def edit
  end

  # POST /job_tasks
  # POST /job_tasks.json
  def create
    @job_task = JobTask.new(job_task_params)

    respond_to do |format|
      if @job_task.save
        format.html { redirect_to @job_task, notice: 'Job task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_task }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_tasks/1
  # PATCH/PUT /job_tasks/1.json
  def update
    respond_to do |format|
      if @job_task.update(job_task_params)
        format.html { redirect_to @job_task, notice: 'Job task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_tasks/1
  # DELETE /job_tasks/1.json
  def destroy
    @job_task.destroy
    respond_to do |format|
      format.html { redirect_to job_tasks_url }
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
      params.require(:job_task).permit(:job_site_id, :task_type_id, :task_note, :target_date, :entered_by_id, :date_completed, :completed_by_id)
    end
end
