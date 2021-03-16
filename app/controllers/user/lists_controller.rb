class User::ListsController < ApplicationController
  before_action :find_user
  before_action :find_user_lists
  before_action :confirm_user

  def index
    binding.pry
  end

  def new
    @list = List.new
  end

  def create
    @list = @user.lists.new(list_params)
    if @list.save
      flash[:notice] = "List Created!"
      redirect_to user_lists_path(@user)
    else
      flash[:notice] = "Please fill in a name."
      render :new
    end
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  private
  def find_user_lists
    @lists = @user.lists
  end
  
  private
  def list_params
    params.require(:list).permit(:name)
  end
end