module ApplicationHelper
  def permission
    if User.find_by_id(session[:user_id])
      if User.find_by_id(session[:user_id]).permission_id
        Permission.find_by_id(User.find_by_id(session[:user_id]).permission_id).title
      end
    end
  end
end
