class MyOrdersController < ApplicationController
  # GET /myorders
  def index
    show if params[:order_id]
    @orders = Order.all.select { |e| e.email == User.find_by_id(session[:user_id]).email }
  end

  # GET /myorders/1
  def show
    @order = Order.find(params[:order_id])
    render template: "my_orders/show"
  end
end
