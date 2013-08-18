class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @users = User.all
  end
end
