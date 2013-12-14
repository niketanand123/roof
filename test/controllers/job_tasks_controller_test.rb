require 'test_helper'

class JobTasksControllerTest < ActionController::TestCase
  setup do
    @job_task = job_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_task" do
    assert_difference('JobTask.count') do
      post :create, job_task: { completed_by_id: @job_task.completed_by_id, date_completed: @job_task.date_completed, entered_by_id: @job_task.entered_by_id, job_site_id: @job_task.job_site_id, target_date: @job_task.target_date, task_note: @job_task.task_note, task_type_id: @job_task.task_type_id }
    end

    assert_redirected_to job_task_path(assigns(:job_task))
  end

  test "should show job_task" do
    get :show, id: @job_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_task
    assert_response :success
  end

  test "should update job_task" do
    patch :update, id: @job_task, job_task: { completed_by_id: @job_task.completed_by_id, date_completed: @job_task.date_completed, entered_by_id: @job_task.entered_by_id, job_site_id: @job_task.job_site_id, target_date: @job_task.target_date, task_note: @job_task.task_note, task_type_id: @job_task.task_type_id }
    assert_redirected_to job_task_path(assigns(:job_task))
  end

  test "should destroy job_task" do
    assert_difference('JobTask.count', -1) do
      delete :destroy, id: @job_task
    end

    assert_redirected_to job_tasks_path
  end
end
