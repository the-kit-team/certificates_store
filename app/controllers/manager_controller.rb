class ManagerController < ApplicationController
  include ApplicationHelper
  
  skip_before_action :authorize if (:permission == 'manager' or :permission == 'admin')
  
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
              @orders.select { |e| e.email        =~ /#{params[:word]}/ } |
              @orders.select { |e| 
                TypeOfLegalEntity.find(e.type_of_legal_entity_id).title =~ /#{params[:word].mb_chars.upcase.to_s}/ # mb_char - for russian language
              }
    render template: "manager/index"
  end
  
  private
  
    def manager_params
      params.require(:manager).permit(:word)
    end
end
