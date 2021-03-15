class User::ListsController < ApplicationController
  before_action :find_user
  before_action :find_user_lists
  before_action :confirm_user

  def index
  end

  def new
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  private
  def find_user_lists
    @lists = @user.lists
  end
end