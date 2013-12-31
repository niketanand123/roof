class AssemblyItemsController < ApplicationController
  before_action :set_assembly_item, only: [:show, :edit, :update, :destroy]

  # GET /assembly_items
  # GET /assembly_items.json
  def index
    @assembly_items = AssemblyItem.all
    @assembly = Assembly.find(params[:assembly_id])
  end

  # GET /assembly_items/1
  # GET /assembly_items/1.json
  def show
  end

  # GET /assembly_items/new
  def new
    @assembly_item = AssemblyItem.new
    @assembly = Assembly.find(params[:assembly_id])
    @item_codes = ItemCode.all
  end

  # GET /assembly_items/1/edit
  def edit
    format_dates
    @item_code = ItemCode.find(@assembly_item.item_code_id)

  end

  def populate_item_code
    if params[:id].present?
      @item_code = ItemCode.find(params[:id])
    else
      @item_code = nil
    end
    if params[:item_percentage_used].present?
      @percentage_used = params[:item_percentage_used]
    else
      @percentage_used = nil
    end
    if params[:sales_tax].present?
      @material_sales_tax = params[:sales_tax]
    else
      @material_sales_tax = nil
    end
    if params[:markup_op_percentage].present?
      @markup_opt_percentage = params[:markup_op_percentage]
    else
      @markup_opt_percentage = nil
    end
    respond_to do |format|
      format.js
    end
  end
  # POST /assembly_items
  # POST /assembly_items.json
  def create
    @assembly = Assembly.find(params[:assembly_id])
    @assembly_item = AssemblyItem.new(assembly_item_params)
    @assembly_item.assembly_id = @assembly.id
    format_dates_before_insert_or_update
    respond_to do |format|
      if @assembly_item.save
        format.html { redirect_to edit_assembly_path(:id=>@assembly.id), notice: 'Assembly item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assembly_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @assembly_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assembly_items/1
  # PATCH/PUT /assembly_items/1.json
  def update
    format_dates_before_insert_or_update
    respond_to do |format|
      if @assembly_item.update(assembly_item_params)
        format.html { redirect_to edit_assembly_path(:id=>@assembly.id), notice: 'Assembly item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assembly_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembly_items/1
  # DELETE /assembly_items/1.json
  def destroy
    @assembly_item.destroy
    respond_to do |format|
      format.html { redirect_to edit_assembly_path(:id=>@assembly.id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly_item
      @assembly_item = AssemblyItem.find(params[:id])
      @assembly = Assembly.find(params[:assembly_id])
      @item_codes = ItemCode.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assembly_item_params
      params.require(:assembly_item).permit(:item_code_id, :unformatted_build_date, :labor_cost, :material_cost, :percentage_used, :material_cost_ext, :item_price, :total_cost, :markup_operator_percentage, :markup_operator_cost, :is_po, :is_wo, :material_tax_percentage, :material_tax_cost)
    end
  def format_dates
    if(@assembly_item.build_date != nil)
      @assembly_item.unformatted_build_date = @assembly_item.build_date.strftime("%m/%d/%Y")
    end
  end

  def format_dates_before_insert_or_update
    @assembly_item.unformatted_build_date = params[:assembly_item][:unformatted_build_date]
  end
  def get_date(date)
    if date != nil && date != ""
      formatDate = Time.strptime(date, "%m/%d/%Y")
    end
  end
end
