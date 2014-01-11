require 'test_helper'

class SalesTaxesControllerTest < ActionController::TestCase
  setup do
    @sales_tax = sales_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_tax" do
    assert_difference('SalesTax.count') do
      post :create, sales_tax: { sales_tax: @sales_tax.sales_tax }
    end

    assert_redirected_to sales_tax_path(assigns(:sales_tax))
  end

  test "should show sales_tax" do
    get :show, id: @sales_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_tax
    assert_response :success
  end

  test "should update sales_tax" do
    patch :update, id: @sales_tax, sales_tax: { sales_tax: @sales_tax.sales_tax }
    assert_redirected_to sales_tax_path(assigns(:sales_tax))
  end

  test "should destroy sales_tax" do
    assert_difference('SalesTax.count', -1) do
      delete :destroy, id: @sales_tax
    end

    assert_redirected_to sales_taxes_path
  end
end
