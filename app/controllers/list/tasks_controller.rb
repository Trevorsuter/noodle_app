class List::TasksController < ApplicationController
  before_action :find_list
  before_action :find_list_user, only: [:create, :update, :destroy]
  before_action :find_task, only: [:edit, :update, :destroy]
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      ListTask.create!(list: @list, task: @task)
      flash[:notice] = "Task Created!"
      redirect_to user_lists_path(current_user)
    else
      flash[:notice] = "You forgot to provide some information."
      render :new
    end
  end

  def edit
  end

  def update
    @task.update_attributes(task_params)
    @task.save
    redirect_to user_lists_path(current_user)
  end

  def destroy
    @task.destroy
    redirect_to user_lists_path(current_user)
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

  private
  def find_task
    @task = Task.find(params[:id])
  end
end