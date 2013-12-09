class JobSitesController < ApplicationController
  #before_action :set_job_site, only: [:show, :edit, :update, :destroy]
  def index
    basedOn = params[:basedOn]
    searchText = params[:searchText]
    if searchText != nil
      search_condition = "%" + searchText + "%"
    end
    #'Contact Name', 'Jobsite Phone', 'Street Address', 'Company Name'
    if basedOn == "Contact Name"
      @job_sites = JobSite.where("is_active=1 and contact_name LIKE ?", search_condition)
    end
    if basedOn == "Jobsite Phone"
      @job_sites = JobSite.where("is_active=1 and phone LIKE ? OR mobile_phone LIKE ? OR work_phone LIKE ?", search_condition, search_condition, search_condition)
    end
    if basedOn == "Street Address"
      @job_sites = JobSite.where("is_active=1 and street1 LIKE ? OR street2 LIKE ?", search_condition, search_condition)
    end
    if basedOn == "Company Name"
      @job_sites = JobSite.where("is_active=1 and company_name LIKE ?", search_condition)
    end
    if @job_sites != nil
      set_map_marker(@job_sites)
    end
  end

  def show
    @job_site = JobSite.find(params[:id])
    set_map_marker(@job_site)
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @job_site = @customer.job_sites.build
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:id])
    set_map_marker(@job_site)
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @job_site = @customer.job_sites.create(job_site_params)

    respond_to do |format|
      if @job_site.save
        format.html { redirect_to([@customer], :notice => 'Job site was successfully created.') }
        format.xml  { render :xml => @job_site, :status => :created, :location => [@customer, @job_site] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:id])

    respond_to do |format|
      if @job_site.update_attributes(job_site_params)
        format.html { redirect_to([@customer], :notice => 'Job site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:id])
    @job_site.is_active=0
    @job_site.update(job_site_params)
    respond_to do |format|
      format.html { redirect_to([@job_site.customer], :notice => 'Job site has been deleted successfully.') }
      format.xml  { head :ok }
    end
  end

  private
    def set_job_site
      @job_site = JobSite.find(params[:id])
    end

    def job_site_params
      params.require(:job_site).permit(:company_name, :contact_name, :phone, :work_phone, :work_phone_ext, :mobile_phone, :fax, :pager, :street1, :street2,
                                       :city, :state, :zip, :direction, :easily_accessible, :cust_vacating_when, :parking_consideration,
                                       :dumpster_loc_note, :side_garage_use, :driveway_dirt_asphalt, :electrical_location,
                                       :water_sanitation_avail, :animals_restrain, :gutter_color_noted, :landscape_concerns,
                                       :work_number_shift, :additional_notes) if params[:job_site]
    end

    def set_job_site_info(job_site)
      job_site_info = "Name: #{job_site.contact_name}
                        </br> Address: #{set_address(job_site)}"
    end

    def set_address(job_site)
      address = "#{job_site.street1}, #{job_site.street2}, #{job_site.city}, #{job_site.state}, US"
    end

    def set_map_marker(job_sites)
      @hash = Gmaps4rails.build_markers(job_sites) do |job_site, marker|
        marker.lat job_site.latitude
        marker.lng job_site.longitude
        marker.infowindow set_job_site_info(job_site)
      end
    end
end
