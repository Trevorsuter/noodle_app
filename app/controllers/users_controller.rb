class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New account created, Welcome to NoodleHub!"
      redirect_to user_dashboard_index_path(@user)
      session[:user_id] = @user.id
    else
      flash[:notice] = "Couldn't create your new account, maybe you forgot some information?"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthday, :email, :password)
  end
end