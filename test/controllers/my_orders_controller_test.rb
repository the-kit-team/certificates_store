require 'test_helper'

class MyOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    login_as :client
    get :index
    assert_response :success
  end

  test "should get show" do
    login_as :client
    puts orders(:one).id
    get :show, id: orders(:one).id
    assert_response :success
  end

end
