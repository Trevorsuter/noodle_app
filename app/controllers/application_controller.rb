class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def confirm_user
    if params[:user_id].to_s != session[:user_id].to_s
      flash[:notice] = "You can't access this person's page."
      redirect_to user_dashboard_index_path(current_user)
    end
  end
  
  def authorized
    unless logged_in?
      flash[:notice] = "You must be logged in to access this page."
      redirect_to root_path
    end
  end
end
