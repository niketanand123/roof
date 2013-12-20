class CustomerTypesController < ApplicationController
  before_action :set_customer_type, only: [:show, :edit, :update, :destroy]

  # GET /customer_types
  # GET /customer_types.json
  def index
    @customer_types = CustomerType.all
  end

  # GET /customer_types/1
  # GET /customer_types/1.json
  def show
  end

  # GET /customer_types/new
  def new
    @customer_type = CustomerType.new
  end

  # GET /customer_types/1/edit
  def edit
  end

  # POST /customer_types
  # POST /customer_types.json
  def create
    @customer_type = CustomerType.new(customer_type_params)

    respond_to do |format|
      if @customer_type.save
        format.html { redirect_to @customer_type, notice: 'Customer type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_types/1
  # PATCH/PUT /customer_types/1.json
  def update
    respond_to do |format|
      if @customer_type.update(customer_type_params)
        format.html { redirect_to @customer_type, notice: 'Customer type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_types/1
  # DELETE /customer_types/1.json
  def destroy
    respond_to do |format|
      if @customer_type.destroy
        format.html { redirect_to customer_types_url, notice: 'Customer Type was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to customer_types_url, notice: "An Error Occurred! #{@customer_type.errors[:base].to_s}"}
        format.json { head :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_type
      @customer_type = CustomerType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_type_params
      params.require(:customer_type).permit(:type)
    end
end
