class ProductColorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product_color, only: [:show, :edit, :update, :destroy]

  # GET /product_colors
  # GET /product_colors.json
  def index
    @product_colors = ProductColor.all
  end

  # GET /product_colors/1
  # GET /product_colors/1.json
  def show
  end

  # GET /product_colors/new
  def new
    @product_color = ProductColor.new
  end

  # GET /product_colors/1/edit
  def edit
  end

  # POST /product_colors
  # POST /product_colors.json
  def create
    @product_color = ProductColor.new(product_color_params)

    respond_to do |format|
      if @product_color.save
        format.html { redirect_to @product_color, notice: 'Product color was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_color }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_colors/1
  # PATCH/PUT /product_colors/1.json
  def update
    respond_to do |format|
      if @product_color.update(product_color_params)
        format.html { redirect_to @product_color, notice: 'Product color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_colors/1
  # DELETE /product_colors/1.json
  def destroy
    respond_to do |format|
      if @product_color.destroy
        format.html { redirect_to product_colors_url, notice: 'Product Color was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to product_colors_url, notice: "An Error Occurred! #{@product_color.errors[:base].to_s}"}
        format.json { head :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_color
      @product_color = ProductColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_color_params
      params.require(:product_color).permit(:product_color)
    end
end
