require 'test_helper'

class AssembliesControllerTest < ActionController::TestCase
  setup do
    @assembly = assemblies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assemblies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assembly" do
    assert_difference('Assembly.count') do
      post :create, assembly: { build_date: @assembly.build_date, is_po: @assembly.is_po, is_wo: @assembly.is_wo, item_description: @assembly.item_description, markup_operator_percentage: @assembly.markup_operator_percentage, markup_total_amt: @assembly.markup_total_amt, master_item: @assembly.master_item, po_description: @assembly.po_description, tax_rate_percentage: @assembly.tax_rate_percentage, total_cost: @assembly.total_cost, total_labor: @assembly.total_labor, total_material: @assembly.total_material, total_price: @assembly.total_price, total_tax: @assembly.total_tax, unit_of_measurement: @assembly.unit_of_measurement, warranty_description: @assembly.warranty_description, wo_description: @assembly.wo_description }
    end

    assert_redirected_to assembly_path(assigns(:assembly))
  end

  test "should show assembly" do
    get :show, id: @assembly
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assembly
    assert_response :success
  end

  test "should update assembly" do
    patch :update, id: @assembly, assembly: { build_date: @assembly.build_date, is_po: @assembly.is_po, is_wo: @assembly.is_wo, item_description: @assembly.item_description, markup_operator_percentage: @assembly.markup_operator_percentage, markup_total_amt: @assembly.markup_total_amt, master_item: @assembly.master_item, po_description: @assembly.po_description, tax_rate_percentage: @assembly.tax_rate_percentage, total_cost: @assembly.total_cost, total_labor: @assembly.total_labor, total_material: @assembly.total_material, total_price: @assembly.total_price, total_tax: @assembly.total_tax, unit_of_measurement: @assembly.unit_of_measurement, warranty_description: @assembly.warranty_description, wo_description: @assembly.wo_description }
    assert_redirected_to assembly_path(assigns(:assembly))
  end

  test "should destroy assembly" do
    assert_difference('Assembly.count', -1) do
      delete :destroy, id: @assembly
    end

    assert_redirected_to assemblies_path
  end
end
