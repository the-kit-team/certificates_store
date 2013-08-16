class AdminController < ApplicationController
  include ApplicationHelper
  
  before_action :admin_permission
  
  def index
    @total_orders = Order.count
    @users = User.all
  end
end
