class MyOrdersController < ApplicationController
  # GET /myorders
  def index
    @orders = Order.where(email: session[:user_email])
  end

  # GET /myorders/1
  def show
    @order = Order.find(params[:order_id])
    render template: "my_orders/show"
  end
end
