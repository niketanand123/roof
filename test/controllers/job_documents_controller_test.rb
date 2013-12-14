require 'test_helper'

class JobDocumentsControllerTest < ActionController::TestCase
  setup do
    @job_document = job_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_document" do
    assert_difference('JobDocument.count') do
      post :create, job_document: { doc_desc: @job_document.doc_desc, doc_link: @job_document.doc_link, doc_name: @job_document.doc_name, job_site_id: @job_document.job_site_id }
    end

    assert_redirected_to job_document_path(assigns(:job_document))
  end

  test "should show job_document" do
    get :show, id: @job_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_document
    assert_response :success
  end

  test "should update job_document" do
    patch :update, id: @job_document, job_document: { doc_desc: @job_document.doc_desc, doc_link: @job_document.doc_link, doc_name: @job_document.doc_name, job_site_id: @job_document.job_site_id }
    assert_redirected_to job_document_path(assigns(:job_document))
  end

  test "should destroy job_document" do
    assert_difference('JobDocument.count', -1) do
      delete :destroy, id: @job_document
    end

    assert_redirected_to job_documents_path
  end
end
