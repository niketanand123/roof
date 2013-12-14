class JobContactsController < ApplicationController
  before_action :set_job_contact, only: [:show, :edit, :update, :destroy]

  # GET /job_contacts
  # GET /job_contacts.json
  def index
    @job_contacts = JobContact.all
  end

  # GET /job_contacts/1
  # GET /job_contacts/1.json
  def show
  end

  # GET /job_contacts/new
  def new
    @job_contact = JobContact.new
  end

  # GET /job_contacts/1/edit
  def edit
  end

  # POST /job_contacts
  # POST /job_contacts.json
  def create
    @job_contact = JobContact.new(job_contact_params)

    respond_to do |format|
      if @job_contact.save
        format.html { redirect_to @job_contact, notice: 'Job contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_contacts/1
  # PATCH/PUT /job_contacts/1.json
  def update
    respond_to do |format|
      if @job_contact.update(job_contact_params)
        format.html { redirect_to @job_contact, notice: 'Job contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_contacts/1
  # DELETE /job_contacts/1.json
  def destroy
    @job_contact.destroy
    respond_to do |format|
      format.html { redirect_to job_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_contact
      @job_contact = JobContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_contact_params
      params.require(:job_contact).permit(:job_site_id, :first_name, :last_name, :contact_type_id, :contact_phone, :contact_email, :contact_notes)
    end
end
