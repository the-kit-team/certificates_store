module ApplicationHelper
  def current_controller? name
    controller.controller_name == name
  end
  
  def permission? permit
    User.find_by_id(session[:user_id]).permission_id == Permission.find_by_title( permit ).id if User.find_by_id(session[:user_id])
  end
end
