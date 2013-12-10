require 'test_helper'

class EstimateTypesControllerTest < ActionController::TestCase
  setup do
    @estimate_type = estimate_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimate_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimate_type" do
    assert_difference('EstimateType.count') do
      post :create, estimate_type: { default_overhead: @estimate_type.default_overhead, estimate_type: @estimate_type.estimate_type }
    end

    assert_redirected_to estimate_type_path(assigns(:estimate_type))
  end

  test "should show estimate_type" do
    get :show, id: @estimate_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimate_type
    assert_response :success
  end

  test "should update estimate_type" do
    patch :update, id: @estimate_type, estimate_type: { default_overhead: @estimate_type.default_overhead, estimate_type: @estimate_type.estimate_type }
    assert_redirected_to estimate_type_path(assigns(:estimate_type))
  end

  test "should destroy estimate_type" do
    assert_difference('EstimateType.count', -1) do
      delete :destroy, id: @estimate_type
    end

    assert_redirected_to estimate_types_path
  end
end
