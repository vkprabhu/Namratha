require 'test_helper'

class DeliversControllerTest < ActionController::TestCase
  setup do
    @deliver = delivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deliver" do
    assert_difference('Deliver.count') do
      post :create, deliver: { date_of_release: @deliver.date_of_release, profile_id: @deliver.profile_id }
    end

    assert_redirected_to deliver_path(assigns(:deliver))
  end

  test "should show deliver" do
    get :show, id: @deliver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deliver
    assert_response :success
  end

  test "should update deliver" do
    patch :update, id: @deliver, deliver: { date_of_release: @deliver.date_of_release, profile_id: @deliver.profile_id }
    assert_redirected_to deliver_path(assigns(:deliver))
  end

  test "should destroy deliver" do
    assert_difference('Deliver.count', -1) do
      delete :destroy, id: @deliver
    end

    assert_redirected_to delivers_path
  end
end
