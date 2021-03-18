class User::DashboardController < ApplicationController
  before_action :find_user, only: [:index]
  before_action :find_partner, only: [:index]
  before_action :confirm_user, only: [:index]

  def index
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  private
  def find_partner
    @partner = @user.partner
  end
end