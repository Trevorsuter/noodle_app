class User::ListsController < ApplicationController
  before_action :find_user
  before_action :confirm_user

  def index
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end