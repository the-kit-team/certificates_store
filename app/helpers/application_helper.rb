module ApplicationHelper
  @current_user
  @latest_user_id

  def current_user
    unless @latest_user_id == session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
      @latest_user_id = session[:user_id]
    end
    @current_user
  end
end
