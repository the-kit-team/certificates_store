require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index when logged in as admin" do
    login_as :admin
    
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { actual_address: @order.actual_address, address_on_english: @order.address_on_english, auditors_names: @order.auditors_names, bank: @order.bank, bank_person: @order.bank_person, bik: @order.bik, company: @order.company, correspondent_account: @order.correspondent_account, creator_name: @order.creator_name, current_account: @order.current_account, email: @order.email, fax: @order.fax, inn: @order.inn, kpp: @order.kpp, ogrn: @order.ogrn, phone: @order.phone, registered_address: @order.registered_address }
    end

    assert_redirected_to home_path
  end

  test "should show order when logged in client, manager or admin" do
    login_as :client
    get :show, id: @order
    assert_response :success
  end

  test "should get edit when logged in as manager or admin" do
    login_as :manager
    get :edit, id: @order
    assert_response :success
  end

  test "should update order when logged in as manager or admin" do
    #patch :update, id: @order, order: { actual_address: @order.actual_address, address_on_english: @order.address_on_english, auditors_names: @order.auditors_names, bank: @order.bank, bank_person: @order.bank_person, bik: @order.bik, company: @order.company, correspondent_account: @order.correspondent_account, creator_name: @order.creator_name, current_account: @order.current_account, email: @order.email, fax: @order.fax, inn: @order.inn, kpp: @order.kpp, ogrn: @order.ogrn, phone: @order.phone, registered_address: @order.registered_address }
    login_as :manager
    patch :update, id: @order, order: { phone: '1234567' }
    assert_redirected_to home_url
  end

  test "should destroy order if logged in as admin" do
    login_as :admin
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_url
  end
end
