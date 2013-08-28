require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new

    assert_response :success
  end

  test "should login" do
    anton = users(:one)
    post :create, email: anton.email, password: 'password'

    assert_response :success
    assert_equal anton.id, session[:user_id]
    assert_redirected_to home_url
  end

  test "should fail login" do
    anton = users(:one)
    post :create, email: anton.email, password: 'wrong'

    assert_redirected_to login_url
  end

  test "should logout if logget in" do
    login_as :client
    delete :destroy

    assert_redirected_to home_url
  end
end
