require 'test_helper'

class JobCallNotesControllerTest < ActionController::TestCase
  setup do
    @job_call_note = job_call_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_call_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_call_note" do
    assert_difference('JobCallNote.count') do
      post :create, job_call_note: { call_date_time: @job_call_note.call_date_time, call_notes: @job_call_note.call_notes, employee_id: @job_call_note.employee_id, job_site_id: @job_call_note.job_site_id }
    end

    assert_redirected_to job_call_note_path(assigns(:job_call_note))
  end

  test "should show job_call_note" do
    get :show, id: @job_call_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_call_note
    assert_response :success
  end

  test "should update job_call_note" do
    patch :update, id: @job_call_note, job_call_note: { call_date_time: @job_call_note.call_date_time, call_notes: @job_call_note.call_notes, employee_id: @job_call_note.employee_id, job_site_id: @job_call_note.job_site_id }
    assert_redirected_to job_call_note_path(assigns(:job_call_note))
  end

  test "should destroy job_call_note" do
    assert_difference('JobCallNote.count', -1) do
      delete :destroy, id: @job_call_note
    end

    assert_redirected_to job_call_notes_path
  end
end
