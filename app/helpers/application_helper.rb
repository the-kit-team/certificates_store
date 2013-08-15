module ApplicationHelper
  def permission
    Permission.find_by_id(User.find_by_id(session[:user_id]).permission_id).title rescue false
  end
end
