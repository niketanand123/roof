class JobCallNotesController < ApplicationController
  before_action :set_job_call_note, only: [:show, :edit, :update, :destroy]

  # GET /job_call_notes
  # GET /job_call_notes.json
  def index
    @job_call_notes = JobCallNote.all
  end

  # GET /job_call_notes/1
  # GET /job_call_notes/1.json
  def show
  end

  # GET /job_call_notes/new
  def new
    @job_call_note = JobCallNote.new
  end

  # GET /job_call_notes/1/edit
  def edit
  end

  # POST /job_call_notes
  # POST /job_call_notes.json
  def create
    @job_call_note = JobCallNote.new(job_call_note_params)

    respond_to do |format|
      if @job_call_note.save
        format.html { redirect_to @job_call_note, notice: 'Job call note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_call_note }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_call_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_call_notes/1
  # PATCH/PUT /job_call_notes/1.json
  def update
    respond_to do |format|
      if @job_call_note.update(job_call_note_params)
        format.html { redirect_to @job_call_note, notice: 'Job call note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_call_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_call_notes/1
  # DELETE /job_call_notes/1.json
  def destroy
    @job_call_note.destroy
    respond_to do |format|
      format.html { redirect_to job_call_notes_url }
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
      params.require(:job_call_note).permit(:job_site_id, :call_date_time, :call_notes, :employee_id)
    end
end
