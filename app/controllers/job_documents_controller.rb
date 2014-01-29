class JobDocumentsController < ApplicationController
  #load_and_authorize_resource
  before_action :set_job_document, only: [:show, :edit, :update, :destroy]

  # GET /job_documents
  # GET /job_documents.json
  def index
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:job_site_id])
    @job_documents = JobDocument.where(:job_site_id =>params[:job_site_id])
  end

  # GET /job_documents/1
  # GET /job_documents/1.json
  def show
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
  end

  # GET /job_documents/new
  def new
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_document = @job_site.job_documents.build(:job_site_id =>@job_site)
  end

  # GET /job_documents/1/edit
  def edit
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
  end

  # POST /job_documents
  # POST /job_documents.json
  def create
    @job_site = JobSite.find(params[:job_document][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)
    @job_document = @job_site.job_documents.create(job_document_params)

    respond_to do |format|
      if @job_document.save
        format.html { redirect_to customer_job_site_job_documents_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Document was successfully created.' }
        format.xml  { render :xml => @job_document, :status => :created, :location => [@job_site, @job_document] }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_documents/1
  # PATCH/PUT /job_documents/1.json
  def update
    @job_site = JobSite.find(params[:job_document][:job_site_id])
    @customer = Customer.find(@job_site.customer_id)

    respond_to do |format|
      if @job_document.update_attributes(job_document_params)
        format.html { redirect_to customer_job_site_job_documents_path(:customer_id=>@customer.id, :id=>@job_document.id,:job_site_id=>@job_document.job_site_id), notice: 'Job Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_documents/1
  # DELETE /job_documents/1.json
  def destroy
    @job_site = JobSite.find(params[:job_site_id])
    @customer = Customer.find(@job_site.customer_id)

    @job_document.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_site_job_documents_path(:customer_id=>@customer.id,:job_site_id => @job_site.id), notice: 'Job Document was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_document
      @job_document = JobDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_document_params
      params.require(:job_document).permit(:job_site_id, :doc_name, :doc_desc, :doc_link)
    end
end
