class JobDocumentsController < ApplicationController
  before_action :set_job_document, only: [:show, :edit, :update, :destroy]

  # GET /job_documents
  # GET /job_documents.json
  def index
    @job_documents = JobDocument.all
  end

  # GET /job_documents/1
  # GET /job_documents/1.json
  def show
  end

  # GET /job_documents/new
  def new
    @job_document = JobDocument.new
  end

  # GET /job_documents/1/edit
  def edit
  end

  # POST /job_documents
  # POST /job_documents.json
  def create
    @job_document = JobDocument.new(job_document_params)

    respond_to do |format|
      if @job_document.save
        format.html { redirect_to @job_document, notice: 'Job document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job_document }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_documents/1
  # PATCH/PUT /job_documents/1.json
  def update
    respond_to do |format|
      if @job_document.update(job_document_params)
        format.html { redirect_to @job_document, notice: 'Job document was successfully updated.' }
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
    @job_document.destroy
    respond_to do |format|
      format.html { redirect_to job_documents_url }
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
