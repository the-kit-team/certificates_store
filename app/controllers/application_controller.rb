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
      if (current_user.client? rescue false)
        case params[:controller]
          when 'sessions'
            return # permit
          when 'home'
            return # permit
          when 'orders'
            case params[:action]
              when 'new', 'create'
                return # permit
            end
          when 'users'
            case params[:action]
              when 'new', 'create'
                return # permit
            end
          when 'my_orders'
            return # permit
          else
            redirect_to home_url
        end
      elsif (current_user.manager? rescue false)
        case params[:controller]
          when 'sessions'
            return # permit
          when 'home'
            return # permit
          when 'users'
            case params[:action]
              when 'new', 'create'
                return # permit
          end
          when 'manager'
            return # permit
          when 'orders'
            case params[:action]
              when 'new', 'create', 'show', 'edit', 'update'
                return # permit
              else
                redirect_to home_url
            end
          else
            redirect_to home_url
        end
      elsif (current_user.admin? rescue false)
        # all permit
      else # not user
        case params[:controller]
          when 'sessions'
            case params[:action]
              when 'new', 'create'
                # permit
            end
          when 'home'
            return # permit
          when 'orders'
            case params[:action]
              when :new, :create
                return # permit
            end
          when 'users'
            case params[:action]
              when :new, :create
                return # permit
            end
          else
            redirect_to login_url, notice: "Please log in"
        end
      end
    end
end
