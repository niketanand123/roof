require 'test_helper'

class JobEstimateStatusesControllerTest < ActionController::TestCase
  setup do
    @job_estimate_status = job_estimate_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_estimate_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_estimate_status" do
    assert_difference('JobEstimateStatus.count') do
      post :create, job_estimate_status: { status: @job_estimate_status.status }
    end

    assert_redirected_to job_estimate_status_path(assigns(:job_estimate_status))
  end

  test "should show job_estimate_status" do
    get :show, id: @job_estimate_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_estimate_status
    assert_response :success
  end

  test "should update job_estimate_status" do
    patch :update, id: @job_estimate_status, job_estimate_status: { status: @job_estimate_status.status }
    assert_redirected_to job_estimate_status_path(assigns(:job_estimate_status))
  end

  test "should destroy job_estimate_status" do
    assert_difference('JobEstimateStatus.count', -1) do
      delete :destroy, id: @job_estimate_status
    end

    assert_redirected_to job_estimate_statuses_path
  end
end
