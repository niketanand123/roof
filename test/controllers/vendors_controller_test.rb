require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { address1: @vendor.address1, address2: @vendor.address2, city1: @vendor.city1, city2: @vendor.city2, email: @vendor.email, gm_name: @vendor.gm_name, gm_phone: @vendor.gm_phone, name: @vendor.name, sales_rep_id: @vendor.sales_rep_id, sales_rep_phone: @vendor.sales_rep_phone, street1: @vendor.street1, street2: @vendor.street2, website: @vendor.website, zip1: @vendor.zip1, zip2: @vendor.zip2 }
    end

    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should show vendor" do
    get :show, id: @vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor
    assert_response :success
  end

  test "should update vendor" do
    patch :update, id: @vendor, vendor: { address1: @vendor.address1, address2: @vendor.address2, city1: @vendor.city1, city2: @vendor.city2, email: @vendor.email, gm_name: @vendor.gm_name, gm_phone: @vendor.gm_phone, name: @vendor.name, sales_rep_id: @vendor.sales_rep_id, sales_rep_phone: @vendor.sales_rep_phone, street1: @vendor.street1, street2: @vendor.street2, website: @vendor.website, zip1: @vendor.zip1, zip2: @vendor.zip2 }
    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete :destroy, id: @vendor
    end

    assert_redirected_to vendors_path
  end
end
