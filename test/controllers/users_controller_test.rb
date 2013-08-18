require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index when logged in as admin" do
    login_as :admin

    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'unique_email', password: 'qwerty', password_confirmation: 'qwerty' }
    end

    assert_redirected_to users_path
  end

  test "should show user when logged in as admin" do
    login_as :admin

    get :show, id: @user
    assert_response :success
  end

  test "should get edit when logged in as admin" do
    login_as :admin

    get :edit, id: @user
    assert_response :success
  end

  test "should update user when logged in as admin" do
    login_as :admin

    patch :update, id: @user, user: { email: 'unique_email' }
    assert_redirected_to users_path
  end

  test "should destroy user when logged in as admin" do
    login_as :admin

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_url
  end
end
