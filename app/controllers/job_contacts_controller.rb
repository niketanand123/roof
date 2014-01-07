class JobContactsController < ApplicationController
  before_action :set_job_contact, only: [:show, :edit, :update, :destroy]

  # GET /job_contacts
  # GET /job_contacts.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_contacts = JobContact.where(:job_site_id =>params[:job_site_id])
  end

  # GET /job_contacts/1
  # GET /job_contacts/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_contact.contact_phone = @job_contact.contact_phone.format_phone
  end

  # GET /job_contacts/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_contact = @job_site.job_contacts.build(:job_site_id =>@job_site)
  end

  # GET /job_contacts/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_contact.contact_phone = @job_contact.contact_phone.format_phone
  end

  # POST /job_contacts
  # POST /job_contacts.json
  def create
    @job_site = JobSite.find(params[:job_contact][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_contact = @job_site.job_contacts.create(job_contact_params)

    respond_to do |format|
      if @job_contact.save
        format.html { redirect_to customer_job_site_job_contacts_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Contact was successfully created.' }
        format.xml  { render :xml => @job_contact, :status => :created, :location => [@job_site, @job_contact] }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_contacts/1
  # PATCH/PUT /job_contacts/1.json
  def update
    @job_site = JobSite.find(params[:job_contact][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)

    respond_to do |format|
      if @job_contact.update_attributes(job_contact_params)
        format.html { redirect_to customer_job_site_job_contacts_path(:customer_id=>@customer.id, :id=>@job_contact.id,:job_site_id=>@job_contact.job_site_id), notice: 'Job Contact was successfully updated.' }
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
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_contact.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_contacts_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Contact was successfully deleted.'  }
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
