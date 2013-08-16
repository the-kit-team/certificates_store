class AdminController < ApplicationController
  before_action { redirect_to home_path if not current_user.admin? }
  
  def index
    @total_orders = Order.count
    @users = User.all
  end
end
