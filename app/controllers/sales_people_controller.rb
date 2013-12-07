class SalesPeopleController < ApplicationController
  before_action :set_sales_person, only: [:show, :edit, :update, :destroy]

  # GET /sales_people
  # GET /sales_people.json
  def index
    @sales_people = SalesPerson.all
  end

  # GET /sales_people/1
  # GET /sales_people/1.json
  def show
  end

  # GET /sales_people/new
  def new
    @sales_person = SalesPerson.new
  end

  # GET /sales_people/1/edit
  def edit
  end

  # POST /sales_people
  # POST /sales_people.json
  def create
    @sales_person = SalesPerson.new(sales_person_params)

    respond_to do |format|
      if @sales_person.save
        format.html { redirect_to @sales_person, notice: 'Sales person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sales_person }
      else
        format.html { render action: 'new' }
        format.json { render json: @sales_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_people/1
  # PATCH/PUT /sales_people/1.json
  def update
    respond_to do |format|
      if @sales_person.update(sales_person_params)
        format.html { redirect_to @sales_person, notice: 'Sales person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sales_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_people/1
  # DELETE /sales_people/1.json
  def destroy
    @sales_person.destroy
    respond_to do |format|
      format.html { redirect_to sales_people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_person
      @sales_person = SalesPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_person_params
      params.require(:sales_person).permit(:first_name, :last_name)
    end
end
