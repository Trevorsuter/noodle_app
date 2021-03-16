class User::ListsController < ApplicationController
  before_action :find_user
  before_action :find_user_lists
  before_action :find_list, only: [:destroy]
  before_action :confirm_user

  def index
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

  def destroy
    @list.destroy
    redirect_to user_lists_path(@user)
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

  private
  def find_list
    @list = List.find(params[:id])
  end
end