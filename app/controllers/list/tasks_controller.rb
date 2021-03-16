class List::TasksController < ApplicationController
  before_action :find_list
  def new
    @task = Task.new
  end

  private
  def find_list
    @list = List.find(params[:list_id])
  end

  def find_list_user
    @user = @list.user
  end
end