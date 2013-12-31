require 'test_helper'

class AssemblyItemsControllerTest < ActionController::TestCase
  setup do
    @assembly_item = assembly_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assembly_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assembly_item" do
    assert_difference('AssemblyItem.count') do
      post :create, assembly_item: { item_code_id: @assembly_item.item_code_id, labor_cost: @assembly_item.labor_cost, material_cost: @assembly_item.material_cost, material_cost_ext: @assembly_item.material_cost_ext, percentage_used: @assembly_item.percentage_used }
    end

    assert_redirected_to assembly_item_path(assigns(:assembly_item))
  end

  test "should show assembly_item" do
    get :show, id: @assembly_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assembly_item
    assert_response :success
  end

  test "should update assembly_item" do
    patch :update, id: @assembly_item, assembly_item: { item_code_id: @assembly_item.item_code_id, labor_cost: @assembly_item.labor_cost, material_cost: @assembly_item.material_cost, material_cost_ext: @assembly_item.material_cost_ext, percentage_used: @assembly_item.percentage_used }
    assert_redirected_to assembly_item_path(assigns(:assembly_item))
  end

  test "should destroy assembly_item" do
    assert_difference('AssemblyItem.count', -1) do
      delete :destroy, id: @assembly_item
    end

    assert_redirected_to assembly_items_path
  end
end
