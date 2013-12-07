require 'test_helper'

class LeadSourcesControllerTest < ActionController::TestCase
  setup do
    @lead_source = lead_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lead_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lead_source" do
    assert_difference('LeadSource.count') do
      post :create, lead_source: { source: @lead_source.source }
    end

    assert_redirected_to lead_source_path(assigns(:lead_source))
  end

  test "should show lead_source" do
    get :show, id: @lead_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lead_source
    assert_response :success
  end

  test "should update lead_source" do
    patch :update, id: @lead_source, lead_source: { source: @lead_source.source }
    assert_redirected_to lead_source_path(assigns(:lead_source))
  end

  test "should destroy lead_source" do
    assert_difference('LeadSource.count', -1) do
      delete :destroy, id: @lead_source
    end

    assert_redirected_to lead_sources_path
  end
end
