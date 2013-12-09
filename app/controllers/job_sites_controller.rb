class JobSitesController < ApplicationController
  #before_action :set_job_site, only: [:show, :edit, :update, :destroy]

  def index
    customer = Customer.find(params[:customer_id])
    @job_sites = customer.job_sites
  end

  def show
    customer = Customer.find(params[:customer_id])
    @job_site = customer.job_sites.find(params[:id])
  end

  def new
    customer = Customer.find(params[:customer_id])
    @job_site = customer.job_sites.build
  end

  def edit
    customer = Customer.find(params[:customer_id])
    @job_site = customer.job_sites.find(params[:id])
  end

  def create
    customer = Customer.find(params[:customer_id])
    @job_site = customer.job_sites.create(job_site_params)

    respond_to do |format|
      if @job_site.save
        format.html { redirect_to([customer], :notice => 'Job site was successfully created.') }
        format.xml  { render :xml => @job_site, :status => :created, :location => [@job_site.customer, @job_site] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    customer = Customer.find(params[:customer_id])
    @job_site = customer.job_sites.find(params[:id])

    respond_to do |format|
      if @job_site.update_attributes(job_site_params)
        format.html { redirect_to([customer], :notice => 'Job site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    @job_site = customer.job_sites.find(params[:id])
    @job_site.is_active=0
    @job_site.update_attributes(job_site_params)

    respond_to do |format|
      format.html { redirect_to([customer],  :notice => 'Job site has been deleted successfully.') }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_site
      @job_site = JobSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_site_params
      params.require(:job_site).permit(:company_name, :contact_name, :phone, :work_phone, :work_phone_ext, :mobile_phone, :fax, :pager, :street1, :street2,
                                       :city, :state, :zip, :direction, :easily_accessible, :cust_vacating_when, :parking_consideration,
                                       :dumpster_loc_note, :side_garage_use, :driveway_dirt_asphalt, :electrical_location,
                                       :water_sanitation_avail, :animals_restrain, :gutter_color_noted, :landscape_concerns,
                                       :work_number_shift, :additional_notes)
    end

end
