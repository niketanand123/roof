class LeadSourcesController < ApplicationController
  before_action :set_lead_source, only: [:show, :edit, :update, :destroy]

  # GET /lead_sources
  # GET /lead_sources.json
  def index
    @lead_sources = LeadSource.all
  end

  # GET /lead_sources/1
  # GET /lead_sources/1.json
  def show
  end

  # GET /lead_sources/new
  def new
    @lead_source = LeadSource.new
  end

  # GET /lead_sources/1/edit
  def edit
  end

  # POST /lead_sources
  # POST /lead_sources.json
  def create
    @lead_source = LeadSource.new(lead_source_params)

    respond_to do |format|
      if @lead_source.save
        format.html { redirect_to @lead_source, notice: 'Lead source was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lead_source }
      else
        format.html { render action: 'new' }
        format.json { render json: @lead_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lead_sources/1
  # PATCH/PUT /lead_sources/1.json
  def update
    respond_to do |format|
      if @lead_source.update(lead_source_params)
        format.html { redirect_to @lead_source, notice: 'Lead source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lead_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_sources/1
  # DELETE /lead_sources/1.json
  def destroy
    respond_to do |format|
      if @lead_source.destroy
        format.html { redirect_to lead_sources_url, notice: 'Lead Source was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to lead_sources_url, notice: "An Error Occurred! #{@lead_source.errors[:base].to_s}"}
        format.json { head :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_source
      @lead_source = LeadSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_source_params
      params.require(:lead_source).permit(:source)
    end
end
