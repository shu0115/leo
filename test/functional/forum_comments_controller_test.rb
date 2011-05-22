require 'test_helper'

class ForumCommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_comment" do
    assert_difference('ForumComment.count') do
      post :create, :forum_comment => { }
    end

    assert_redirected_to forum_comment_path(assigns(:forum_comment))
  end

  test "should show forum_comment" do
    get :show, :id => forum_comments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => forum_comments(:one).to_param
    assert_response :success
  end

  test "should update forum_comment" do
    put :update, :id => forum_comments(:one).to_param, :forum_comment => { }
    assert_redirected_to forum_comment_path(assigns(:forum_comment))
  end

  test "should destroy forum_comment" do
    assert_difference('ForumComment.count', -1) do
      delete :destroy, :id => forum_comments(:one).to_param
    end

    assert_redirected_to forum_comments_path
  end
end
