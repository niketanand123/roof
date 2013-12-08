require 'test_helper'

class JobSitesControllerTest < ActionController::TestCase
  setup do
    @job_site = job_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_site" do
    assert_difference('JobSite.count') do
      post :create, job_site: {  }
    end

    assert_redirected_to job_site_path(assigns(:job_site))
  end

  test "should show job_site" do
    get :show, id: @job_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_site
    assert_response :success
  end

  test "should update job_site" do
    patch :update, id: @job_site, job_site: {  }
    assert_redirected_to job_site_path(assigns(:job_site))
  end

  test "should destroy job_site" do
    assert_difference('JobSite.count', -1) do
      delete :destroy, id: @job_site
    end

    assert_redirected_to job_sites_path
  end
end
