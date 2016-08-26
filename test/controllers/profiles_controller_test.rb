require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { DOB: @profile.DOB, current_manager: @profile.current_manager, designation_id: @profile.designation_id, domain: @profile.domain, employeeid: @profile.employeeid, experience: @profile.experience, first_name: @profile.first_name, hr: @profile.hr, last_name: @profile.last_name, level: @profile.level, phone_number: @profile.phone_number, previous_manager: @profile.previous_manager, primary_technology: @profile.primary_technology, secondary_technology: @profile.secondary_technology, sublocation_id: @profile.sublocation_id, user_id: @profile.user_id }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { DOB: @profile.DOB, current_manager: @profile.current_manager, designation_id: @profile.designation_id, domain: @profile.domain, employeeid: @profile.employeeid, experience: @profile.experience, first_name: @profile.first_name, hr: @profile.hr, last_name: @profile.last_name, level: @profile.level, phone_number: @profile.phone_number, previous_manager: @profile.previous_manager, primary_technology: @profile.primary_technology, secondary_technology: @profile.secondary_technology, sublocation_id: @profile.sublocation_id, user_id: @profile.user_id }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
