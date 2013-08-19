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
      if current_user
        if current_user.client?
          redirect_to home_url if not client_workplace
        elsif current_user.manager?
          redirect_to home_url if not manager_workplace
        elsif current_user.admin?
          redirect_to home_url if not admin_workplace
        else
          redirect_to home_url
        end
      else # not user
        redirect_to login_url, notice: "Please log in" if not logout_workplace
      end
    end
    
    def logout_workplace
      request_to controller: ['home'] or
      request_to controller: ['sessions', 'orders', 'users'], action: ['new', 'create']
    end
    
    def client_workplace
      request_to controller: ['sessions', 'home', 'my_orders'] or
      request_to controller: ['users', 'orders'], action: ['new', 'create']
    end
      
    def manager_workplace
      request_to controller: ['sessions', 'home', 'manager'] or
      request_to controller: ['users'], action: ['new', 'create'] or
      request_to controller: ['orders'], action: ['new', 'create', 'show', 'edit', 'update']
    end
    
    def admin_workplace
      true # all places
    end
    
    def request_to args={}
      if args[:controller].include? params[:controller]
        if args[:action]
          args[:action].include? params[:action]
        else
          true
        end
      else
        false
      end
    end
end
