class User::PartnerController < ApplicationController
  before_action :find_user_and_partner
  
  def update
    @user.update_attribute(:partner, @partner)
    @partner.update_attribute(:partner, @user)
    @partner_request.destroy_all
    flash[:notice] = "Partnership Created!"
    redirect_to user_dashboard_index_path(@user)
  end

  private
  def find_user_and_partner
    @user = User.find(params[:user_id])
    @partner = User.find(params[:id])
    @partner_request = PartnerRequest.where(user: @partner, partner: @user)
  end
end