class User::PartnerRequestsController < ApplicationController
  before_action :find_partner, only: [:create]
  before_action :find_user, only: [:create]
  def create
    if !@partner.nil?
      @user.partner_requests.create(partner: find_partner)
      flash[:notice] = "Partner Request submitted! Waiting on their approval."
    else
      flash[:notice] = "Email Not found, could not submit your request."
    end
    redirect_to user_dashboard_index_path(@user)
  end

  private
  def find_partner
    @partner = User.where(email: params[:partner_email]).first
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end