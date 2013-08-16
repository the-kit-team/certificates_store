class MyOrdersController < ApplicationController
  # GET /my_orders
  def index
    @orders = Order.where(email: session[:user_email])
  end

  # GET /show?id=1
  def show
    @order = Order.find(params[:id])
  end
end
