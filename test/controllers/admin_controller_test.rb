require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should redirect to login page unless logged in as admin" do
    get :index
    assert_redirected_to login_url
  end

  test "should get index if logged in as admin" do
    login_as(:admin)

    get :index
    assert_response :success
  end
end
