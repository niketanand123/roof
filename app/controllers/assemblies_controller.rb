class AssembliesController < ApplicationController
  before_action :set_assembly, only: [:show, :edit, :update, :destroy]

  # GET /assemblies
  # GET /assemblies.json
  def index
    @assemblies = Assembly.all
  end

  # GET /assemblies/1
  # GET /assemblies/1.json
  def show
  end

  # GET /assemblies/new
  def new
    @assembly = Assembly.new
  end

  # GET /assemblies/1/edit
  def edit
    format_dates
    @assembly_items = AssemblyItem.where("assembly_id=?", @assembly.id)
    @assembly.total_material = AssemblyItem.sum(:material_cost, :conditions => {:assembly_id=>@assembly.id})
    @assembly.total_tax = AssemblyItem.sum(:material_tax_cost, :conditions => {:assembly_id=>@assembly.id})
    @assembly.tax_rate_percentage = AssemblyItem.average(:material_tax_percentage, :conditions => {:assembly_id=>@assembly.id})
    @assembly.total_labor = AssemblyItem.sum(:labor_cost, :conditions => {:assembly_id=>@assembly.id})
    @assembly.total_cost = AssemblyItem.sum(:total_cost, :conditions => {:assembly_id=>@assembly.id})
    @assembly.markup_operator_percentage = AssemblyItem.average(:markup_operator_percentage, :conditions => {:assembly_id=>@assembly.id})
    @assembly.markup_total_amt = AssemblyItem.sum(:markup_operator_cost, :conditions => {:assembly_id=>@assembly.id})
    @assembly.total_price = AssemblyItem.sum(:item_price, :conditions => {:assembly_id=>@assembly.id})
  end

  # POST /assemblies
  # POST /assemblies.json
  def create
    @assembly = Assembly.new(assembly_params)
    format_dates_before_insert_or_update
    respond_to do |format|
      if @assembly.save
        format.html { redirect_to edit_assembly_path(:id=>@assembly.id), notice: 'Assembly was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assemblies/1
  # PATCH/PUT /assemblies/1.json
  def update
    format_dates_before_insert_or_update
    respond_to do |format|
      if @assembly.update(assembly_params)
        format.html { redirect_to assemblies_path, method:"get", notice: 'Assembly was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assemblies/1
  # DELETE /assemblies/1.json
  def destroy
    @assembly.destroy
    respond_to do |format|
      format.html { redirect_to assemblies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly
      @assembly = Assembly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assembly_params
      params.require(:assembly).permit(:master_item, :unformatted_build_date, :item_description, :warranty_description, :wo_description, :proposal_description, :is_po, :is_wo, :uom_id, :total_material, :tax_rate_percentage, :total_tax, :total_labor, :total_cost, :markup_operator_percentage, :markup_total_amt, :total_price)
    end
  def format_dates
    if(@assembly.build_date !=nil)
      @assembly.unformatted_build_date = @assembly.build_date.strftime("%m/%d/%Y")
    end
  end

  def format_dates_before_insert_or_update
    @assembly.unformatted_build_date = params[:assembly][:unformatted_build_date]
  end
  def get_date(date)
    if date != nil && date != ""
      formatDate = Time.strptime(date, "%m/%d/%Y")
    end
  end
end
