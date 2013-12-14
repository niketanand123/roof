require 'test_helper'

class JobCostingsControllerTest < ActionController::TestCase
  setup do
    @job_costing = job_costings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_costings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_costing" do
    assert_difference('JobCosting.count') do
      post :create, job_costing: { job_cost: @job_costing.job_cost, job_site_id: @job_costing.job_site_id, labor: @job_costing.labor, materials: @job_costing.materials, net_profit: @job_costing.net_profit, overhead: @job_costing.overhead, overhead_percentage: @job_costing.overhead_percentage }
    end

    assert_redirected_to job_costing_path(assigns(:job_costing))
  end

  test "should show job_costing" do
    get :show, id: @job_costing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_costing
    assert_response :success
  end

  test "should update job_costing" do
    patch :update, id: @job_costing, job_costing: { job_cost: @job_costing.job_cost, job_site_id: @job_costing.job_site_id, labor: @job_costing.labor, materials: @job_costing.materials, net_profit: @job_costing.net_profit, overhead: @job_costing.overhead, overhead_percentage: @job_costing.overhead_percentage }
    assert_redirected_to job_costing_path(assigns(:job_costing))
  end

  test "should destroy job_costing" do
    assert_difference('JobCosting.count', -1) do
      delete :destroy, id: @job_costing
    end

    assert_redirected_to job_costings_path
  end
end
