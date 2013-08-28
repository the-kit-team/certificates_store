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
      post :create, user: { email: 'unique@email.net', password: 'qwerty', password_confirmation: 'qwerty' }
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
  
  test "should send welcome after create new user" do
    email = 'unique_client@client.com'
    assert_difference("MainMailer.deliveries.count") do
      assert_difference('User.count') do
        post :create, user: { email: email, password: 'qwerty', password_confirmation: 'qwerty' }
      end
    end
    
    welcome_email = MainMailer.deliveries.last
    
    assert_equal ['support@licenziyaplus.ru'], welcome_email.from
    assert_equal email, welcome_email.to[0]
    assert_equal 'Добро пожаловать на сайт licenziyaplus.ru', welcome_email.subject
    assert_match /Добро пожаловать на сайт licenziyaplus.ru/, welcome_email.text_part.body.to_s
    assert_match /<h1>Добро пожаловать на сайт licenziyaplus.ru<\/h1>/, welcome_email.html_part.body.to_s
  end
end
