class AdminController < ApplicationController
  before_action :admin_permission
  
  def index
    @total_orders = Order.count
    @users = User.all
  end
end
