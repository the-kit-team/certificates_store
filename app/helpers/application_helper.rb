module ApplicationHelper
  def permission
    current_user.permission rescue false
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
