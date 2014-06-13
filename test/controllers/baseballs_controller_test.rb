require 'test_helper'

class BaseballsControllerTest < ActionController::TestCase
  setup do
    @baseball = baseballs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baseballs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baseball" do
    assert_difference('Baseball.count') do
      post :create, baseball: { away_team: @baseball.away_team, city: @baseball.city, date: @baseball.date, home_team: @baseball.home_team, state: @baseball.state, time: @baseball.time, zip: @baseball.zip }
    end

    assert_redirected_to baseball_path(assigns(:baseball))
  end

  test "should show baseball" do
    get :show, id: @baseball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baseball
    assert_response :success
  end

  test "should update baseball" do
    patch :update, id: @baseball, baseball: { away_team: @baseball.away_team, city: @baseball.city, date: @baseball.date, home_team: @baseball.home_team, state: @baseball.state, time: @baseball.time, zip: @baseball.zip }
    assert_redirected_to baseball_path(assigns(:baseball))
  end

  test "should destroy baseball" do
    assert_difference('Baseball.count', -1) do
      delete :destroy, id: @baseball
    end

    assert_redirected_to baseballs_path
  end
end
