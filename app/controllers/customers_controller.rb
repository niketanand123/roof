class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    #@customers = Customer.search(params[:basedOn],params[:searchText])
    basedOn = params[:basedOn]
    @searchText = params[:searchText]
    if @searchText != nil
      search_condition = "%" + @searchText + "%"
      if basedOn == "Last Name"
        @customers = Customer.where("is_active=1 and last_name LIKE ?", search_condition)
      end
      if basedOn == "Phone Number"
        @customers = Customer.where("is_active=1 and (home_phone LIKE ? OR mobile_phone LIKE ? OR work_phone LIKE ?)", search_condition, search_condition, search_condition)
      end
      if basedOn == "Street Address"
        @customers = Customer.where("is_active=1 and (street1 LIKE ? OR street2 LIKE ?)", search_condition, search_condition)
      end
      if basedOn == "Company Name"
        @customers = Customer.joins(:company).where("customer.is_active=1 and companies.name LIKE ?", search_condition)
      end
      if @customers != nil
        set_map_marker(@customers)
      end
    end
  end


  # GET /customers/1
  # GET /customers/1.json
  def show
    @job_sites = JobSite.where("is_active=1 and customer_id = ?",@customer.id)
    set_map_marker(@customer)
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @job_sites = JobSite.where("is_active=1 and customer_id = ?",@customer.id)
    set_map_marker(@customer)
  end

  def new_job_site
    @job_sites = JobSite.where("is_active=1 and customer_id = ?",@customer.id)
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.is_active=0
    @customer.update(customer_params)
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer has been deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :street1, :street2, :city, :state, :zip,
                                       :home_phone, :mobile_phone, :work_phone, :work_phone_ext, :fax, :website,
                                       :misc, :type, :company_id, :lead_source_id, :sales_person_id, :title) if params[:customer]
    end

    def set_customer_name(customer)
      customer_name = "Name: #{customer.first_name} #{customer.last_name}
                      </br> Address: #{set_address(customer)}"
    end

    def set_address(customer)
      address = "#{customer.street1}, #{customer.street2}, #{customer.city}, #{customer.state}, US"
    end

    def set_map_marker(customers)
      @hash = Gmaps4rails.build_markers(customers) do |customer, marker|
        marker.lat customer.latitude
        marker.lng customer.longitude
        marker.infowindow set_customer_name(customer)
      end
    end
end
