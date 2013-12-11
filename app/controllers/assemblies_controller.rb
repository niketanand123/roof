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
  end

  # POST /assemblies
  # POST /assemblies.json
  def create
    @assembly = Assembly.new(assembly_params)

    respond_to do |format|
      if @assembly.save
        format.html { redirect_to @assembly, notice: 'Assembly was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assembly }
      else
        format.html { render action: 'new' }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assemblies/1
  # PATCH/PUT /assemblies/1.json
  def update
    respond_to do |format|
      if @assembly.update(assembly_params)
        format.html { redirect_to @assembly, notice: 'Assembly was successfully updated.' }
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
      params.require(:assembly).permit(:master_item, :build_date, :item_description, :warranty_description, :wo_description, :po_description, :is_po, :is_wo, :unit_of_measurement, :total_material, :tax_rate_percentage, :total_tax, :total_labor, :total_cost, :markup_operator_percentage, :markup_total_amt, :total_price)
    end
end
