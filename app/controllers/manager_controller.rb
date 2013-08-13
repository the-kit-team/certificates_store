class ManagerController < ApplicationController
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
    @orders = Order.all.select { |e| e.company      =~ /#{params[:word]}/ } |
              Order.all.select { |e| e.phone        =~ /#{params[:word]}/ } |
              Order.all.select { |e| e.fax          =~ /#{params[:word]}/ } |
              Order.all.select { |e| e.creator_name =~ /#{params[:word]}/ } |
              Order.all.select { |e| e.email        =~ /#{params[:word]}/ }
    render template: "manager/index"
  end
  
  def manager_params
    params.require(:manager).permit(:word)
  end
end
