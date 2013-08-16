module ApplicationHelper
  @current_user
  @last_user_id
  
  def user_is permission
    permission && @current_user
  end
  
  def set_current_user
    if (not @last_user_id == session[:user_id]) or @last_user_id == nil
      @last_user_id = session[:user_id]
      @current_user = User.find(session[:user_id]).permission.title
    end
  end
end
