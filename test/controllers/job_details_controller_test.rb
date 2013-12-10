require 'test_helper'

class JobDetailsControllerTest < ActionController::TestCase
  setup do
    @job_detail = job_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_detail" do
    assert_difference('JobDetail.count') do
      post :create, job_detail: { assign_to: @job_detail.assign_to, contract_price: @job_detail.contract_price, date_completed: @job_detail.date_completed, date_taken: @job_detail.date_taken, deposit_due: @job_detail.deposit_due, deposit_method: @job_detail.deposit_method, estimate_type_id: @job_detail.estimate_type_id, existing_roof_type_id: @job_detail.existing_roof_type_id, how_many_stories: @job_detail.how_many_stories, info_taken_by_id: @job_detail.info_taken_by_id, job_notes: @job_detail.job_notes, job_start_date: @job_detail.job_start_date, job_status_id: @job_detail.job_status_id, lead_sheet_note: @job_detail.lead_sheet_note, new_roof_type: @job_detail.new_roof_type, product_color_id: @job_detail.product_color_id, product_type_id: @job_detail.product_type_id, sales_rep_id: @job_detail.sales_rep_id }
    end

    assert_redirected_to job_detail_path(assigns(:job_detail))
  end

  test "should show job_detail" do
    get :show, id: @job_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_detail
    assert_response :success
  end

  test "should update job_detail" do
    patch :update, id: @job_detail, job_detail: { assign_to: @job_detail.assign_to, contract_price: @job_detail.contract_price, date_completed: @job_detail.date_completed, date_taken: @job_detail.date_taken, deposit_due: @job_detail.deposit_due, deposit_method: @job_detail.deposit_method, estimate_type_id: @job_detail.estimate_type_id, existing_roof_type_id: @job_detail.existing_roof_type_id, how_many_stories: @job_detail.how_many_stories, info_taken_by_id: @job_detail.info_taken_by_id, job_notes: @job_detail.job_notes, job_start_date: @job_detail.job_start_date, job_status_id: @job_detail.job_status_id, lead_sheet_note: @job_detail.lead_sheet_note, new_roof_type: @job_detail.new_roof_type, product_color_id: @job_detail.product_color_id, product_type_id: @job_detail.product_type_id, sales_rep_id: @job_detail.sales_rep_id }
    assert_redirected_to job_detail_path(assigns(:job_detail))
  end

  test "should destroy job_detail" do
    assert_difference('JobDetail.count', -1) do
      delete :destroy, id: @job_detail
    end

    assert_redirected_to job_details_path
  end
end
