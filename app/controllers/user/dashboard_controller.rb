class User::DashboardController < ApplicationController
  before_action :find_user, only: [:index]
  before_action :confirm_user, only: [:index]

  def index
    @partner_request = PartnerRequest.new
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end