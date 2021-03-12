class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  
  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    unless logged_in?
      flash[:notice] = "You must be logged in to access this page."
      redirect_to root_path
    end
  end
end
