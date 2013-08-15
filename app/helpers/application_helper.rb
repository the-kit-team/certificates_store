module ApplicationHelper
  def permission
    Permission.find_by_id(current_user.permission_id).title rescue false
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
