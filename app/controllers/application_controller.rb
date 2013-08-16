class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :set_i18n_locale_from_params
  before_action :authorize
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not avalible"
          logger.error flash.now[:notice]
        end
      end
    end
    
    def default_url_options
      { locale: I18n.locale }
    end
    
    def authorize
      if not User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def admin_permission
      redirect_to home_path if not current_user.admin?
    end
    
    def manager_permission
      redirect_to home_path if not current_user.manager?
    end
end
