class ManagerController < ApplicationController
  def index
    if params[:status]
      @orders = Order.where(status_id: params[:status])
    else
      @orders = Order.all
    end
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
