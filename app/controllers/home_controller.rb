class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    fresh_when current_user
  end
end
