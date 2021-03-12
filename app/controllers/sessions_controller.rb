class SessionsController < ApplicationController

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
end