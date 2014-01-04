class AssemblyItemsController < ApplicationController
  include ActionView::Helpers::NumberHelper
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
      @percentage_used = 100
    end
    if params[:sales_tax].present?
      @material_sales_tax = params[:sales_tax]
    else
      @material_sales_tax = 0
    end
    if params[:markup_op_percentage].present?
      @markup_opt_percentage = params[:markup_op_percentage]
    else
      @markup_opt_percentage = 0
    end
    if params[:labor_cost].present?
      @labor_cost = params[:labor_cost]
    else
      @labor_cost = 0
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
        update_assembly(@assembly, @assembly_item, false)
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
        update_assembly(@assembly, @assembly_item, false)
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
    update_assembly(@assembly, @assembly_item, true)
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
      params.require(:assembly_item).permit(:item_code_id, :unformatted_build_date, :labor_cost, :material_cost, :percentage_used, :material_cost_ext, :total_material_cost, :item_price, :total_cost, :markup_operator_percentage, :markup_operator_cost, :is_po, :is_wo, :material_tax_percentage, :material_tax_cost)
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

  def update_assembly(assembly, assembly_item, is_delete)
    assembly_items = AssemblyItem.where("assembly_id = ? and id != ?", assembly.id, assembly_item.id)
    material_cost = 0
    sales_tax_percentage = 0
    sales_tax = 0
    total_material_cost = 0
    labor_cost = 0
    total_cost = 0
    markup_percentage = 0
    total_price = 0

    assembly_items.each do |item|
      material_cost = material_cost + item.material_cost unless item.material_cost.nil?
      sales_tax_percentage = sales_tax_percentage + item.material_tax_percentage unless item.material_tax_percentage.nil?
      sales_tax = sales_tax + item.material_tax_cost unless item.material_tax_cost.nil?
      total_material_cost = total_material_cost + item.total_material_cost unless item.total_material_cost.nil?
      labor_cost = labor_cost + item.labor_cost unless item.labor_cost.nil?
      total_cost = total_cost + item.total_cost unless item.total_cost.nil?
      markup_percentage = markup_percentage + item.markup_operator_percentage unless item.markup_operator_percentage.nil?
      total_price = total_price + item.item_price unless item.item_price.nil?
    end
    if is_delete
      material_cost = material_cost - assembly_item.material_cost unless assembly_item.material_cost.nil?
      sales_tax_percentage = sales_tax_percentage - assembly_item.material_tax_percentage unless assembly_item.material_tax_percentage.nil?
      sales_tax = sales_tax - assembly_item.material_tax_cost unless assembly_item.material_tax_cost.nil?
      total_material_cost = total_material_cost - assembly_item.material_cost unless assembly_item.material_cost.nil?
      labor_cost = labor_cost - assembly_item.labor_cost unless assembly_item.labor_cost.nil?
      total_cost = total_cost - assembly_item.total_cost unless assembly_item.total_cost.nil?
      markup_percentage = markup_percentage - assembly_item.markup_operator_percentage unless assembly_item.markup_operator_percentage.nil?
      total_price = total_price - assembly_item.item_price unless assembly_item.item_price.nil?
      total_items_size = 1
      if assembly_items.size > 1
        total_items_size = assembly_items.size - 1
      end
      tax_rate_percentage = number_with_precision(sales_tax_percentage / total_items_size, :precision => 2)
      markup_operator_percentage = number_with_precision(markup_percentage / total_items_size, :precision => 2)
    else
      material_cost = material_cost + assembly_item.material_cost unless assembly_item.material_cost.nil?
      sales_tax_percentage = sales_tax_percentage + assembly_item.material_tax_percentage unless assembly_item.material_tax_percentage.nil?
      sales_tax = sales_tax + assembly_item.material_tax_cost unless assembly_item.material_tax_cost.nil?
      total_material_cost = total_material_cost + assembly_item.material_cost unless assembly_item.material_cost.nil?
      labor_cost = labor_cost + assembly_item.labor_cost unless assembly_item.labor_cost.nil?
      total_cost = total_cost + assembly_item.total_cost unless assembly_item.total_cost.nil?
      markup_percentage = markup_percentage + assembly_item.markup_operator_percentage unless assembly_item.markup_operator_percentage.nil?
      total_price = total_price + assembly_item.item_price unless assembly_item.item_price.nil?
      total_items_size = assembly_items.size + 1
      tax_rate_percentage = number_with_precision(sales_tax_percentage / total_items_size, :precision => 2)
      markup_operator_percentage = number_with_precision(markup_percentage / total_items_size, :precision => 2)

    end
    assembly_build_date = assembly.build_date.strftime("%m/%d/%Y") unless assembly.build_date.nil?
    assembly.update_attributes(:total_material=>material_cost, :tax_rate_percentage=>tax_rate_percentage, :total_tax=>sales_tax,
                                :total_material_cost=>total_material_cost, :total_labor=>labor_cost, :total_cost=>total_cost,
                                :markup_operator_percentage=>markup_operator_percentage,  :total_price=>total_price, :unformatted_build_date=>assembly_build_date)

  end
end
