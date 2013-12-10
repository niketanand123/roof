require 'test_helper'

class RoofTypesControllerTest < ActionController::TestCase
  setup do
    @roof_type = roof_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roof_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roof_type" do
    assert_difference('RoofType.count') do
      post :create, roof_type: { roof_type: @roof_type.roof_type }
    end

    assert_redirected_to roof_type_path(assigns(:roof_type))
  end

  test "should show roof_type" do
    get :show, id: @roof_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roof_type
    assert_response :success
  end

  test "should update roof_type" do
    patch :update, id: @roof_type, roof_type: { roof_type: @roof_type.roof_type }
    assert_redirected_to roof_type_path(assigns(:roof_type))
  end

  test "should destroy roof_type" do
    assert_difference('RoofType.count', -1) do
      delete :destroy, id: @roof_type
    end

    assert_redirected_to roof_types_path
  end
end
