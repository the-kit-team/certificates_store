module ApplicationHelper
<<<<<<< HEAD
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
=======
  def permission
    Permission.find_by_id(current_user.permission_id).title rescue false
  end

  def current_user
    User.find_by_id(session[:user_id])
>>>>>>> fa6586db17ca8a7adebc1e5247d72a27d93ca57f
  end
end
