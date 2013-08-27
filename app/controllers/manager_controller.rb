class ManagerController < ApplicationController
  before_action { redirect_to home_url if not (current_user.manager? or current_user.admin?) }
  
  # GET /manager
  # GET /manager?status=1
  def index
    if params[:status_filter]
      @orders = Order.where(status_id: params[:status_filter])
      @orders_cache = cache_key(params[:status_filter], @orders)
      fresh_when cache_key(params[:status_filter], @orders), public: true
    else
      @orders = Order.all
      @orders_cache = cache_key('all', @orders)
      fresh_when cache_key('all', @orders), public: true
    end
    @orders = @orders.reverse
  end
  
  # GET /find?word=searhing_word
  def find
    @orders = Order.all
    @orders = @orders.select { |e| e.id           == params[:word].to_i } |
              @orders.select { |e| e.company      =~ /#{params[:word]}/ } |
              @orders.select { |e| e.phone        =~ /#{params[:word]}/ } |
              @orders.select { |e| e.fax          =~ /#{params[:word]}/ } |
              @orders.select { |e| e.creator_name =~ /#{params[:word]}/ } |
              @orders.select { |e| e.email        =~ /#{params[:word]}/ } |
              @orders.select { |e| 
                e.type_of_legal_entity.title =~ /#{params[:word].mb_chars.upcase.to_s}/ # mb_char - for russian language
              }
    filter_word = "find-#{params[:word]}"
    count = @orders.count
    max_updated_at = @orders.max_by(&:updated_at)
    @orders_cache = "orders/#{filter_word}-#{count}-#{max_updated_at}"
    @orders = @orders.reverse
    render template: "manager/index"
  end
  
  private
  
    def manager_params
      params.require(:manager).permit(:word)
    end
    
    def cache_key(filter, orders)
      count          = orders.count
      max_updated_at = orders.maximum(:updated_at).to_s
      "orders/#{filter}-#{count}-#{max_updated_at}"
    end
end
