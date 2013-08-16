class ManagerController < ApplicationController
  before_action { redirect_to home_path if not current_user.admin? or current_user.manager? }
  
  # GET /manager
  # GET /manager?status=1
  def index
    if params[:status_filter]
      @orders = Order.where(status_id: params[:status_filter]).reverse
      @cache_key = "#{params[:status_filter]}"
    else
      @orders = Order.all.reverse
      @cache_key = 'all'
    end
    @order_latest = @orders.sort_by(&:updated_at).last
  end
  
  # GET /find?word=searhing_word
  def find
    @orders = Order.all.reverse
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
