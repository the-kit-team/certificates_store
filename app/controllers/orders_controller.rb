class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  # GET /orders/1.pdf
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.status_id = 1 # new

    respond_to do |format|
      if @order.save
        format.html { redirect_to home_path, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to home_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:type_of_certificate_id, :type_of_legal_entity_id, :company, :creator_name, :registered_address, :actual_address, :address_on_english, :phone, :fax, :email, :inn, :kpp, :ogrn, :bank, :current_account, :correspondent_account, :bik, :bank_person, :auditors_names, :status_id, :list_of_works_category_ids => [])
    end
    
    def check_user_is_admin
      redirect_to home_path if not current_user.admin?
    end
    
    def check_user_is_manager_or_admin
      redirect_to home_path if not (current_user.manager? or current_user.admin?)
    end
end
