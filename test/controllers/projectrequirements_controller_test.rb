require 'test_helper'

class ProjectrequirementsControllerTest < ActionController::TestCase
  setup do
    @projectrequirement = projectrequirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projectrequirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projectrequirement" do
    assert_difference('Projectrequirement.count') do
      post :create, projectrequirement: { desgination_id: @projectrequirement.desgination_id, domain: @projectrequirement.domain, experience: @projectrequirement.experience, integer: @projectrequirement.integer, level: @projectrequirement.level, location_id: @projectrequirement.location_id, primary_technology: @projectrequirement.primary_technology, secondary_technology: @projectrequirement.secondary_technology, sublocation_id: @projectrequirement.sublocation_id }
    end

    assert_redirected_to projectrequirement_path(assigns(:projectrequirement))
  end

  test "should show projectrequirement" do
    get :show, id: @projectrequirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projectrequirement
    assert_response :success
  end

  test "should update projectrequirement" do
    patch :update, id: @projectrequirement, projectrequirement: { desgination_id: @projectrequirement.desgination_id, domain: @projectrequirement.domain, experience: @projectrequirement.experience, integer: @projectrequirement.integer, level: @projectrequirement.level, location_id: @projectrequirement.location_id, primary_technology: @projectrequirement.primary_technology, secondary_technology: @projectrequirement.secondary_technology, sublocation_id: @projectrequirement.sublocation_id }
    assert_redirected_to projectrequirement_path(assigns(:projectrequirement))
  end

  test "should destroy projectrequirement" do
    assert_difference('Projectrequirement.count', -1) do
      delete :destroy, id: @projectrequirement
    end

    assert_redirected_to projectrequirements_path
  end
end
