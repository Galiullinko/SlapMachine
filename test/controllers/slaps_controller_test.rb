require 'test_helper'

class SlapsControllerTest < ActionController::TestCase
  setup do
    @slap = slaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slap" do
    assert_difference('Slap.count') do
      post :create, slap: { text: @slap.text }
    end

    assert_redirected_to slap_path(assigns(:slap))
  end

  test "should show slap" do
    get :show, id: @slap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slap
    assert_response :success
  end

  test "should update slap" do
    patch :update, id: @slap, slap: { text: @slap.text }
    assert_redirected_to slap_path(assigns(:slap))
  end

  test "should destroy slap" do
    assert_difference('Slap.count', -1) do
      delete :destroy, id: @slap
    end

    assert_redirected_to slaps_path
  end
end
