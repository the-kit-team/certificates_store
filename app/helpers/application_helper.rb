module ApplicationHelper
  @current_user_permission
  @latest_user_id
  
  def permission
    unless @latest_user_id == session[:user_id]
      @current_user_permission = User.find_by_id(session[:user_id]).permission.title rescue false
      @latest_user_id = session[:user_id]
    end
    @current_user_permission
  end

  def current_user_admin?
    permission == 'admin'
  end

  def current_user_manager?
    permission == 'manager'
  end

  def current_user_client?
    permission == 'client'
  end
end
