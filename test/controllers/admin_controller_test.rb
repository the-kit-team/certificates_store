require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should redirect to login page unless logged in as admin" do
    get :index
    assert_redirected_to login_url
  end

end
