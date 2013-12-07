class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    #@customers = Customer.search(params[:basedOn],params[:searchText])
    basedOn = params[:basedOn]
    searchText = params[:searchText]
    if basedOn == "Last Name"
      search_condition = "%" + searchText + "%"
      @customers = Customer.where("last_name LIKE ?", search_condition)
    end
    if basedOn == "Phone Number"
      search_condition = "%" + searchText + "%"
      @customers = Customer.where("home_phone LIKE ? OR mobile_phone LIKE ? OR work_phone LIKE ?", search_condition, search_condition, search_condition)
    end
    if basedOn == "Street Address"
      search_condition = "%" + searchText + "%"
      @customers = Customer.where("street1 LIKE ? OR street2 LIKE ?", search_condition, search_condition)
    end
    if basedOn == "Company Name"
      search_condition = "%" + searchText + "%"
      @customers = Customer.where("company_name LIKE ?", search_condition)
    end
  end

  #def search
  #  @customers = Customer.search params[:search]
  #end
  # GET /customers/1
  # GET /customers/1.json
  def show
    #@customer = Customer.find params[:id]
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    #@customer = Customer.find params[:id]
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
    #@customer = Customer.find params[:id]
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
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
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
                                       :home_phone, :mobile_phone, :work_phone, :work_phone_ext, :fax, :pager,
                                       :misc, :type, :company_id, :lead_source_id, :sales_person_id, :company_name, :title)
    end
end
