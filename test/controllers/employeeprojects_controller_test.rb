require 'test_helper'

class EmployeeprojectsControllerTest < ActionController::TestCase
  setup do
    @employeeproject = employeeprojects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employeeprojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employeeproject" do
    assert_difference('Employeeproject.count') do
      post :create, employeeproject: { domain: @employeeproject.domain, end_date: @employeeproject.end_date, start_date: @employeeproject.start_date, user_id: @employeeproject.user_id }
    end

    assert_redirected_to employeeproject_path(assigns(:employeeproject))
  end

  test "should show employeeproject" do
    get :show, id: @employeeproject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employeeproject
    assert_response :success
  end

  test "should update employeeproject" do
    patch :update, id: @employeeproject, employeeproject: { domain: @employeeproject.domain, end_date: @employeeproject.end_date, start_date: @employeeproject.start_date, user_id: @employeeproject.user_id }
    assert_redirected_to employeeproject_path(assigns(:employeeproject))
  end

  test "should destroy employeeproject" do
    assert_difference('Employeeproject.count', -1) do
      delete :destroy, id: @employeeproject
    end

    assert_redirected_to employeeprojects_path
  end
end
