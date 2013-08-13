class ManagerController < ApplicationController
  def index
    @orders = Order.all
  end

  def newest
    @orders = Order.where(status_id: 1)
  end

  def inwork
    @orders = Order.where(status_id: 2)
  end

  def isdone
    @orders = Order.where(status_id: 3)
  end

  def canceled
    @orders = Order.where(status_id: 4)
  end
  
  def find
    @orders = Order.where("id           = #{params[:word]} or 
                           company      = #{params[:word]} or
                           creator_name = #{params[:word]} or
                           phone        = #{params[:word]} or
                           fax          = #{params[:word]} or
                           bik          = #{params[:word]} or
                           status_id    = #{params[:word]}")
    render template: "manager/index"
  end
  
  def manager_params
    params.require(:manager).permit(:word)
  end
end
