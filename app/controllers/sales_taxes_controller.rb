class SalesTaxesController < ApplicationController
  before_action :set_sales_tax, only: [:show, :edit, :update, :destroy]

  # GET /sales_taxes
  # GET /sales_taxes.json
  def index
    #@sales_taxes = SalesTax.all
    return edit
  end

  # GET /sales_taxes/1
  # GET /sales_taxes/1.json
  def show
  end

  # GET /sales_taxes/new
  def new
    @sales_tax = SalesTax.new
  end

  # GET /sales_taxes/1/edit
  def edit
  end

  # POST /sales_taxes
  # POST /sales_taxes.json
  def create
    @sales_tax = SalesTax.new(sales_tax_params)

    respond_to do |format|
      if @sales_tax.save
        format.html { redirect_to @sales_tax, notice: 'Sales tax was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sales_tax }
      else
        format.html { render action: 'new' }
        format.json { render json: @sales_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_taxes/1
  # PATCH/PUT /sales_taxes/1.json
  def update
    respond_to do |format|
      if @sales_tax.update(sales_tax_params)
        format.html { redirect_to @sales_tax, notice: 'Sales tax was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sales_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_taxes/1
  # DELETE /sales_taxes/1.json
  def destroy
    @sales_tax.destroy
    respond_to do |format|
      format.html { redirect_to sales_taxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_tax
      @sales_tax = SalesTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_tax_params
      params.require(:sales_tax).permit(:sales_tax)
    end
end
