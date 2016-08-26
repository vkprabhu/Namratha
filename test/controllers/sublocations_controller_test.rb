require 'test_helper'

class SublocationsControllerTest < ActionController::TestCase
  setup do
    @sublocation = sublocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sublocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sublocation" do
    assert_difference('Sublocation.count') do
      post :create, sublocation: { location_id: @sublocation.location_id, name: @sublocation.name }
    end

    assert_redirected_to sublocation_path(assigns(:sublocation))
  end

  test "should show sublocation" do
    get :show, id: @sublocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sublocation
    assert_response :success
  end

  test "should update sublocation" do
    patch :update, id: @sublocation, sublocation: { location_id: @sublocation.location_id, name: @sublocation.name }
    assert_redirected_to sublocation_path(assigns(:sublocation))
  end

  test "should destroy sublocation" do
    assert_difference('Sublocation.count', -1) do
      delete :destroy, id: @sublocation
    end

    assert_redirected_to sublocations_path
  end
end
