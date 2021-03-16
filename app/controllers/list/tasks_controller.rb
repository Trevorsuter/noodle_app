class List::TasksController < ApplicationController
  before_action :find_list
  before_action :find_list_user, only: [:create]
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      ListTask.create!(list: @list, task: @task)
      flash[:notice] = "Task Created!"
      redirect_to user_lists_path(@user.id)
    else
      flash[:notice] = "You must forgot to provide some information."
      render :new
    end
  end

  private
  def find_list
    @list = List.find(params[:list_id])
  end

  private
  def find_list_user
    @user = @list.user
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :due, :status)
  end
end