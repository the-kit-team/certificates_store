class MyOrdersController < ApplicationController
  before_action { redirect_to home_url if not (current_user.client? or current_user.admin?) }
  
  # GET /my_orders
  def index
    @orders = Order.where(email: session[:user_email])
  end

  # GET /show?id=1
  def show
    @order = Order.find(params[:id])
  end
end
