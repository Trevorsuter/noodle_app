class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
  end
end