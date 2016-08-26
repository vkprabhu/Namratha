require 'test_helper'

class DesginationsControllerTest < ActionController::TestCase
  setup do
    @desgination = desginations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desginations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desgination" do
    assert_difference('Desgination.count') do
      post :create, desgination: { name: @desgination.name }
    end

    assert_redirected_to desgination_path(assigns(:desgination))
  end

  test "should show desgination" do
    get :show, id: @desgination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desgination
    assert_response :success
  end

  test "should update desgination" do
    patch :update, id: @desgination, desgination: { name: @desgination.name }
    assert_redirected_to desgination_path(assigns(:desgination))
  end

  test "should destroy desgination" do
    assert_difference('Desgination.count', -1) do
      delete :destroy, id: @desgination
    end

    assert_redirected_to desginations_path
  end
end
