require 'test_helper'

class UnitOfMeasurementsControllerTest < ActionController::TestCase
  setup do
    @unit_of_measurement = unit_of_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_of_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_of_measurement" do
    assert_difference('UnitOfMeasurement.count') do
      post :create, unit_of_measurement: { unit: @unit_of_measurement.unit }
    end

    assert_redirected_to unit_of_measurement_path(assigns(:unit_of_measurement))
  end

  test "should show unit_of_measurement" do
    get :show, id: @unit_of_measurement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit_of_measurement
    assert_response :success
  end

  test "should update unit_of_measurement" do
    patch :update, id: @unit_of_measurement, unit_of_measurement: { unit: @unit_of_measurement.unit }
    assert_redirected_to unit_of_measurement_path(assigns(:unit_of_measurement))
  end

  test "should destroy unit_of_measurement" do
    assert_difference('UnitOfMeasurement.count', -1) do
      delete :destroy, id: @unit_of_measurement
    end

    assert_redirected_to unit_of_measurements_path
  end
end
