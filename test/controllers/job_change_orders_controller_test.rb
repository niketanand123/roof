require 'test_helper'

class JobChangeOrdersControllerTest < ActionController::TestCase
  setup do
    @job_change_order = job_change_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_change_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_change_order" do
    assert_difference('JobChangeOrder.count') do
      post :create, job_change_order: { co_number: @job_change_order.co_number, co_total: @job_change_order.co_total, job_site_id: @job_change_order.job_site_id, notes: @job_change_order.notes }
    end

    assert_redirected_to job_change_order_path(assigns(:job_change_order))
  end

  test "should show job_change_order" do
    get :show, id: @job_change_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_change_order
    assert_response :success
  end

  test "should update job_change_order" do
    patch :update, id: @job_change_order, job_change_order: { co_number: @job_change_order.co_number, co_total: @job_change_order.co_total, job_site_id: @job_change_order.job_site_id, notes: @job_change_order.notes }
    assert_redirected_to job_change_order_path(assigns(:job_change_order))
  end

  test "should destroy job_change_order" do
    assert_difference('JobChangeOrder.count', -1) do
      delete :destroy, id: @job_change_order
    end

    assert_redirected_to job_change_orders_path
  end
end
