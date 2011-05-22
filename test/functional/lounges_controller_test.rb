require 'test_helper'

class LoungesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lounges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lounge" do
    assert_difference('Lounge.count') do
      post :create, :lounge => { }
    end

    assert_redirected_to lounge_path(assigns(:lounge))
  end

  test "should show lounge" do
    get :show, :id => lounges(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lounges(:one).to_param
    assert_response :success
  end

  test "should update lounge" do
    put :update, :id => lounges(:one).to_param, :lounge => { }
    assert_redirected_to lounge_path(assigns(:lounge))
  end

  test "should destroy lounge" do
    assert_difference('Lounge.count', -1) do
      delete :destroy, :id => lounges(:one).to_param
    end

    assert_redirected_to lounges_path
  end
end
