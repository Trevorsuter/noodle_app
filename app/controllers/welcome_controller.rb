class WelcomeController < ApplicationController
  def index
    if params[:commit]
      @user = User.where(email: params[:email], password: params[:password]).first
      if @user.nil?
        flash[:notice] = "Invalid email or password"
        render :index
      else
        redirect_to user_dashboard_index_path(@user)
      end
    end
  end
end