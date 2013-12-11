require 'test_helper'

class ItemCodesControllerTest < ActionController::TestCase
  setup do
    @item_code = item_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_code" do
    assert_difference('ItemCode.count') do
      post :create, item_code: { item_code: @item_code.item_code, item_cost: @item_code.item_cost, item_name: @item_code.item_name, labor_rate: @item_code.labor_rate, material_cost: @item_code.material_cost, material_w_tax: @item_code.material_w_tax, retail_price: @item_code.retail_price, uom: @item_code.uom }
    end

    assert_redirected_to item_code_path(assigns(:item_code))
  end

  test "should show item_code" do
    get :show, id: @item_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_code
    assert_response :success
  end

  test "should update item_code" do
    patch :update, id: @item_code, item_code: { item_code: @item_code.item_code, item_cost: @item_code.item_cost, item_name: @item_code.item_name, labor_rate: @item_code.labor_rate, material_cost: @item_code.material_cost, material_w_tax: @item_code.material_w_tax, retail_price: @item_code.retail_price, uom: @item_code.uom }
    assert_redirected_to item_code_path(assigns(:item_code))
  end

  test "should destroy item_code" do
    assert_difference('ItemCode.count', -1) do
      delete :destroy, id: @item_code
    end

    assert_redirected_to item_codes_path
  end
end
