class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    fresh_when session[:user_email]
  end
end
