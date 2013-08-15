class AdminController < ApplicationController
  include ApplicationHelper
  
  before_action :check_pemissions
  
  def index
    @total_orders = Order.count
    @users = User.all
  end
    
  private
  
    def check_pemissions
      redirect_to home_path if not permission == 'admin'
    end
end
