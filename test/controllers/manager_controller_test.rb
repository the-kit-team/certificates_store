require 'test_helper'

class ManagerControllerTest < ActionController::TestCase
  test "should get index if logged in as manager" do
    login_as(:manager)
    get :index
    assert_response :success
  end

  test "should redirect to login unless logged in as admin or manager" do
    get :index
    assert_redirected_to login_url
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get find" do
    get :find
    assert_response :success
  end

end
