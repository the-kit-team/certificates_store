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
      else
        case params[:controller]
        when 'admin'
          redirect_to login_url, notice: "You need admin's permission" if not current_user.admin?
        when 'manager'
          redirect_to login_url, notice: "You need admin's or manager's permission" if not (current_user.admin? or current_user.manager?)
        when 'orders'
          case params[:action]
          when 'index', 'show', 'edit', 'update'
            redirect_to login_url, notice: "You need admin's or manager's permission" if not (current_user.admin? or current_user.manager?)
          when 'destroy'
            redirect_to login_url, notice: "You need admin's permission" if not current_user.admin?
          end
        when 'users'
          case params[:action]
          when 'index', 'show', 'edit', 'update', 'destroy'
            redirect_to login_url, notice: "You need admin's permission" if not current_user.admin?
          end
        end
      end
    end
end
