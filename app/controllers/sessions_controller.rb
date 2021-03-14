class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]
  
  def create
    @user = User.find_by(email: params[:email])

    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_dashboard_index_path(@user)
    else
      flash[:notice] = "login unsuccessful"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to root_path
  end
end