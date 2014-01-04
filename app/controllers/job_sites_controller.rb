class JobSitesController < ApplicationController
  #before_action :set_job_site, only: [:show, :edit, :update, :destroy]
  def index
    basedOn = params[:basedOn]
    @searchText = params[:searchText]
    if @searchText != nil
      search_condition = "%" + @searchText + "%"
    end
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
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:id])
    format_dates
    @service_types = ServiceType.all
    @job_service_types = JobServiceType.where("job_id" =>@job_site.id)
    @service_type_ids = @job_service_types.collect{|p| p.service_type_id}
    set_map_marker(@job_site)
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @job_site = @customer.job_sites.build
    @service_types = ServiceType.all
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:id])
    format_dates
    @service_types = ServiceType.all
    @job_service_types = JobServiceType.where("job_id" =>@job_site.id)
    @service_type_ids = @job_service_types.collect{|p| p.service_type_id}
    set_map_marker(@job_site)
  end

  def lead_sheet
    @job_site = JobSite.find(params[:id])
    @customer = Customer.find(@job_site.customer_id)
  end

  def estimate
    @job_site = JobSite.find(params[:id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimates = JobEstimate.order("step asc").where(:job_site_id =>@job_site.id)
  end

  def proposal
    @job_site = JobSite.find(params[:id])
    @customer = Customer.find(@job_site.customer_id)
    @job_estimates = JobEstimate.order("step asc").where(:job_site_id =>@job_site.id)
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @job_site = @customer.job_sites.create(job_site_params)
    update_customer_status
    format_dates_before_insert_or_update
    respond_to do |format|
      if @job_site.save
        job_service_type_save
        format.html { redirect_to([@customer], :notice => 'Job site was successfully created.') }
        format.xml  { render :xml => @job_site, :status => :created, :location => [@customer, @job_site] }
      else
        format_dates
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @job_site = JobSite.find(params[:id])

    update_customer_status
    format_dates_before_insert_or_update
    respond_to do |format|
      if @job_site.update_attributes(job_site_params)
        job_service_type_update
        format.html { redirect_to([@customer], :notice => 'Job site was successfully updated.') }
        format.xml  { head :ok }
      else
        format_dates
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_customer_status
    job_status_id = params[:job_site][:job_status_id]
    if job_status_id != nil && job_status_id.length > 0
      @job_status = JobStatus.find(job_status_id)
      @is_closed = false
      if @job_status.is_job_closed
        @is_closed = true
        @job_site.is_closed = true
      else
        @job_site.is_closed = false
        @job_sites = JobSite.where("is_active=1 and customer_id = ? and id != ? and is_closed = true",@customer.id, @job_site.id)
        if @job_sites.size > 0
          @is_closed = true
        end
      end
      if @is_closed
        @customer.status = "Existing"
      else
        @customer.status = "Lead"
      end
      @customer.update_attribute("status", @customer.status)
    end
  end

  def destroy
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
      params.require(:job_site).permit(:contact_name, :phone, :work_phone, :work_phone_ext, :mobile_phone, :fax, :website, :street1, :street2,
                                       :city, :state, :zip, :direction, :easily_accessible, :cust_vacating_when, :parking_consideration,
                                       :dumpster_loc_note, :side_garage_use, :driveway_dirt_asphalt, :electrical_location,
                                       :water_sanitation_avail, :animals_restrain, :gutter_color_noted, :landscape_concerns,
                                       :work_number_shift, :additional_notes, :job_status_id, :how_many_stories,
                                       :existing_roof_type_id, :new_roof_type_id, :product_type_id, :product_color_id, :sales_rep_id,
                                       :estimate_type_id, :contract_price, :deposit_due, :deposit_method, :job_notes,
                                       :lead_sheet_note, :info_taken_by_id) if params[:job_site]
    end

    def set_job_site_info(job_site)
      job_site_info = "Name: #{job_site.contact_name}
                        </br> Address: #{set_address(job_site)}"
    end

    def get_date(date)
      if date != nil && date != ""
        formatDate = Time.strptime(date, "%m/%d/%Y")
      end
    end

    def format_dates
      if(@job_site.job_start_date !=nil)
        @job_site.job_start_date = @job_site.job_start_date.strftime("%m/%d/%Y")
      end
      if(@job_site.date_taken !=nil)
        @job_site.date_taken = @job_site.date_taken.strftime("%m/%d/%Y")
      end
      if(@job_site.date_completed !=nil)
        @job_site.date_completed = @job_site.date_completed.strftime("%m/%d/%Y")
      end
    end

    def format_dates_before_insert_or_update
      @job_site.job_start_date = get_date(params[:job_site][:job_start_date])
      @job_site.date_completed = get_date(params[:job_site][:date_completed])
      @job_site.date_taken = get_date(params[:job_site][:date_taken])
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

  def job_service_type_save
    if params[:service_types_checkbox] != nil
      params[:service_types_checkbox].each do |check|
        service_type_id_value = check
        @job_service_type = JobServiceType.new("job_id" =>@job_site.id, "service_type_id"=>service_type_id_value)
        @job_service_type.save
      end
    end
  end
  def job_service_type_update
    @job_service_types = JobServiceType.where("job_id" =>@job_site.id)
    if @job_service_types != nil
      @job_service_types.destroy_all
    end
    if params[:service_types_checkbox] != nil
      params[:service_types_checkbox].each do |check|
        @job_service_type = JobServiceType.new("job_id" =>@job_site.id, "service_type_id"=>check.to_f)
        @job_service_type.save
      end
    end
  end
end
