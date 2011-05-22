require 'test_helper'

class GuildRanksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guild_ranks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guild_rank" do
    assert_difference('GuildRank.count') do
      post :create, :guild_rank => { }
    end

    assert_redirected_to guild_rank_path(assigns(:guild_rank))
  end

  test "should show guild_rank" do
    get :show, :id => guild_ranks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => guild_ranks(:one).to_param
    assert_response :success
  end

  test "should update guild_rank" do
    put :update, :id => guild_ranks(:one).to_param, :guild_rank => { }
    assert_redirected_to guild_rank_path(assigns(:guild_rank))
  end

  test "should destroy guild_rank" do
    assert_difference('GuildRank.count', -1) do
      delete :destroy, :id => guild_ranks(:one).to_param
    end

    assert_redirected_to guild_ranks_path
  end
end
