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
          if requare controller: ['sessions', 'home', 'my_orders'] # permit
          elsif requare controller: ['orders', 'users'], action: ['new', 'create'] # permit
          else redirect_to home_url
          end
        elsif current_user.manager?
          if requare controller: ['sessions', 'home', 'manager'] # permit
          elsif requare controller: 'users', action: ['new', 'create'] # permit
          elsif requare controller: 'orders', action: ['new', 'create', 'show', 'edit', 'update'] # permit
          else redirect_to home_url
          end
        elsif current_user.admin? # all permit
        else
          redirect_to home_url
        end
      else # not user
        if requare controller: ['sessions', 'home'] # permit
        elsif requare controller: ['orders', 'users'], action: ['new', 'create'] # permit
        else redirect_to login_url, notice: "Please log in"
        end
      end
    end
    
    def requare arg={}
      if arg[:controller].include? params[:controller] 
        if arg[:action]
          arg[:action].include? params[:action]
        else
          true
        end
      else
        false
      end
    end
end
