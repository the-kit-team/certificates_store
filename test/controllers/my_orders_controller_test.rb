require 'test_helper'

class MyOrdersControllerTest < ActionController::TestCase
  test "should get index if logged in as client" do
    login_as :client

    get :index
    assert_response :success
  end

  test "should get show if logged in as client" do
    login_as :client

    get :show, id: orders(:one).id
    assert_response :success
  end

end
