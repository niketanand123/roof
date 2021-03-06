class JobCallNotesController < ApplicationController
  #load_and_authorize_resource except: [:create]
  before_action :set_job_call_note, only: [:show, :edit, :update, :destroy]

  # GET /job_call_notes
  # GET /job_call_notes.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_call_notes = JobCallNote.where(:job_site_id =>params[:job_site_id])
  end

  # GET /job_call_notes/1
  # GET /job_call_notes/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    format_dates
  end

  # GET /job_call_notes/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_call_note = @job_site.job_call_notes.build(:job_site_id =>@job_site)
    @job_call_note.unformatted_call_date = Time.now.strftime("%m/%d/%Y")
    @job_call_note.call_time = Time.now.strftime("%H:%M")
  end

  # GET /job_call_notes/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    format_dates
  end

  # POST /job_call_notes
  # POST /job_call_notes.json
  def create
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_call_note = @job_site.job_call_notes.create(job_call_note_params)
    format_dates_before_insert_or_update
    respond_to do |format|
      if @job_call_note.save
        format.html { redirect_to customer_job_site_job_call_notes_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job call note was successfully created.' }
        format.xml  { render :xml => @job_call_note, :status => :created, :location => [@job_site, @job_call_note] }
      else
        format_dates
        format.html { render action: 'new' }
        format.json { render json: @job_call_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_call_notes/1
  # PATCH/PUT /job_call_notes/1.json
  def update
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    format_dates_before_insert_or_update
    respond_to do |format|
      if @job_call_note.update(job_call_note_params)
        format.html { redirect_to customer_job_site_job_call_notes_path(:customer_id=>@customer.id, :id=>@job_call_note.id,:job_site_id=>@job_call_note.job_site_id), notice: 'Job call note was successfully updated.' }
        format.json { head :no_content }
      else
        format_dates
        format.html { render action: 'edit' }
        format.json { render json: @job_call_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_call_notes/1
  # DELETE /job_call_notes/1.json
  def destroy
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_call_note.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_call_notes_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job call note was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_call_note
      @job_call_note = JobCallNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_call_note_params
      params.require(:job_call_note).permit(:job_site_id, :unformatted_call_date,:call_time, :call_notes, :user_id) if params[:job_call_note]
    end
  def format_dates
    if(@job_call_note.call_date !=nil)
      @job_call_note.unformatted_call_date = @job_call_note.call_date.strftime("%m/%d/%Y")
    end
  end

  def format_dates_before_insert_or_update
    @job_call_note.unformatted_call_date = params[:job_call_note][:unformatted_call_date]
  end
  def get_date(date)
    if date != nil && date != ""
      formatDate = Time.strptime(date, "%m/%d/%Y")
    end
  end
end
