require 'test_helper'

class JobContactsControllerTest < ActionController::TestCase
  setup do
    @job_contact = job_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_contact" do
    assert_difference('JobContact.count') do
      post :create, job_contact: { contact_email: @job_contact.contact_email, contact_notes: @job_contact.contact_notes, contact_phone: @job_contact.contact_phone, contact_type_id: @job_contact.contact_type_id, first_name: @job_contact.first_name, job_site_id: @job_contact.job_site_id, last_name: @job_contact.last_name }
    end

    assert_redirected_to job_contact_path(assigns(:job_contact))
  end

  test "should show job_contact" do
    get :show, id: @job_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_contact
    assert_response :success
  end

  test "should update job_contact" do
    patch :update, id: @job_contact, job_contact: { contact_email: @job_contact.contact_email, contact_notes: @job_contact.contact_notes, contact_phone: @job_contact.contact_phone, contact_type_id: @job_contact.contact_type_id, first_name: @job_contact.first_name, job_site_id: @job_contact.job_site_id, last_name: @job_contact.last_name }
    assert_redirected_to job_contact_path(assigns(:job_contact))
  end

  test "should destroy job_contact" do
    assert_difference('JobContact.count', -1) do
      delete :destroy, id: @job_contact
    end

    assert_redirected_to job_contacts_path
  end
end
