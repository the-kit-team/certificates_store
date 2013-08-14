class ManagerController < ApplicationController
  include ApplicationHelper
  
  before_action :check_permissions
  
  # GET /manager
  # GET /manager?status=1
  def index
    if params[:status]
      @orders = Order.where(status_id: params[:status])
    else
      @orders = Order.all
    end
  end
  
  # GET /find?word=searhing_word
  def find
    @orders = Order.all
    @orders = @orders.select { |e| e.company      =~ /#{params[:word]}/ } |
              @orders.select { |e| e.phone        =~ /#{params[:word]}/ } |
              @orders.select { |e| e.fax          =~ /#{params[:word]}/ } |
              @orders.select { |e| e.creator_name =~ /#{params[:word]}/ } |
              @orders.select { |e| e.email        =~ /#{params[:word]}/ }
    render template: "manager/index"
  end
  
  private
  
    def manager_params
      params.require(:manager).permit(:word)
    end
    
    def check_permissions
      redirect_to home_path if permission != 'manager'
    end
end
