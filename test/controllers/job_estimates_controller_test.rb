require 'test_helper'

class JobEstimatesControllerTest < ActionController::TestCase
  setup do
    @job_estimate = job_estimates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_estimates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_estimate" do
    assert_difference('JobEstimate.count') do
      post :create, job_estimate: { item_extended: @job_estimate.item_extended, job_detail_id: @job_estimate.job_detail_id, master_item_id: @job_estimate.master_item_id, proposal_desc: @job_estimate.proposal_desc, qty: @job_estimate.qty, retail_price: @job_estimate.retail_price, step: @job_estimate.step, warranty_desc: @job_estimate.warranty_desc }
    end

    assert_redirected_to job_estimate_path(assigns(:job_estimate))
  end

  test "should show job_estimate" do
    get :show, id: @job_estimate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_estimate
    assert_response :success
  end

  test "should update job_estimate" do
    patch :update, id: @job_estimate, job_estimate: { item_extended: @job_estimate.item_extended, job_detail_id: @job_estimate.job_detail_id, master_item_id: @job_estimate.master_item_id, proposal_desc: @job_estimate.proposal_desc, qty: @job_estimate.qty, retail_price: @job_estimate.retail_price, step: @job_estimate.step, warranty_desc: @job_estimate.warranty_desc }
    assert_redirected_to job_estimate_path(assigns(:job_estimate))
  end

  test "should destroy job_estimate" do
    assert_difference('JobEstimate.count', -1) do
      delete :destroy, id: @job_estimate
    end

    assert_redirected_to job_estimates_path
  end
end
