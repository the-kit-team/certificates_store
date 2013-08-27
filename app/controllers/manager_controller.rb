class ManagerController < ApplicationController
  before_action { redirect_to home_url if not (current_user.manager? or current_user.admin?) }
  
  # GET /manager
  # GET /manager?status=1
  def index
    if params[:status_filter]
      @orders = Order.where(status_id: params[:status_filter]).reverse
      @orders = Order.where(status_id: params[:status_filter])
      @orders_cache = cache_key(params[:status_filter], @orders)
    else
      @orders = Order.all.reverse
      @orders = Order.all
      @orders_cache = cache_key('all', @orders)
    end
  end
  
  # GET /find?word=searhing_word
  def find
    @orders = Order.all.reverse
    @orders = Order.all
    @orders = @orders.select { |e| e.id           == params[:word].to_i } |
              @orders.select { |e| e.company      =~ /#{params[:word]}/ } |
              @orders.select { |e| e.phone        =~ /#{params[:word]}/ } |
              @orders.select { |e| e.fax          =~ /#{params[:word]}/ } |
              @orders.select { |e| e.creator_name =~ /#{params[:word]}/ } |
              @orders.select { |e| e.email        =~ /#{params[:word]}/ } |
              @orders.select { |e| 
                TypeOfLegalEntity.find(e.type_of_legal_entity_id).title =~ /#{params[:word].mb_chars.upcase.to_s}/ # mb_char - for russian language
              }
    type = 'Find'
    count = @orders.count
    max_updated_at = @orders.max_by(&:updated_at)
    @orders_cache = "orders/#{type}-#{count}-#{max_updated_at}"
    render template: "manager/index"
  end
  
  private
  
    def manager_params
      params.require(:manager).permit(:word)
    end
    
    def cache_key(filter, orders)
      count          = orders.count
      max_updated_at = orders.maximum(:updated_at).try(:utc).try(:to_s, :number)
      "orders/#{filter}-#{count}-#{max_updated_at}"
    end
end
