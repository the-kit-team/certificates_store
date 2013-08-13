class ManagerController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def find
  end
end
