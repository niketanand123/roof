class ItemCodesController < ApplicationController
  before_action :set_item_code, only: [:show, :edit, :update, :destroy]

  # GET /item_codes
  # GET /item_codes.json
  def index
    @item_codes = ItemCode.all
  end

  # GET /item_codes/1
  # GET /item_codes/1.json
  def show
  end

  # GET /item_codes/new
  def new
    @item_code = ItemCode.new
  end

  # GET /item_codes/1/edit
  def edit
  end

  # POST /item_codes
  # POST /item_codes.json
  def create
    @item_code = ItemCode.new(item_code_params)

    respond_to do |format|
      if @item_code.save
        format.html { redirect_to @item_code, notice: 'Item code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_codes/1
  # PATCH/PUT /item_codes/1.json
  def update
    respond_to do |format|
      if @item_code.update(item_code_params)
        format.html { redirect_to @item_code, notice: 'Item code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_codes/1
  # DELETE /item_codes/1.json
  def destroy
    respond_to do |format|
      if @item_code.destroy
        format.html { redirect_to item_codes_url, notice: 'Item Code was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to item_codes_url, notice: "An Error Occurred! #{@item_code.errors[:base].to_s}"}
        format.json { head :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_code
      @item_code = ItemCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_code_params
      params.require(:item_code).permit(:item_code, :item_name, :uom, :item_cost, :material_cost, :material_w_tax, :labor_rate, :retail_price)
    end
end
