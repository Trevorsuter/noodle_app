class User < ApplicationRecord
  belongs_to :partner, foreign_key: :partner_id, class_name: 'User', inverse_of: :partner, optional: true
  has_many :lists
  has_many :partner_requests
  has_many :participants
  has_many :games, through: :participants
  has_many :competitions, through: :games

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :birthday
  validates_presence_of :password

  has_secure_password

  def incoming_requests_with_names
    PartnerRequest.joins(:user).where(partner_id: self.id).select('partner_requests.*, users.name as username')
  end

  def pending_request?
    pending_requests.any?
  end

  def pending_requests
    partner_requests.map do |pr|
      pr.partner
    end
  end

  def combined_lists
    if !partner.nil?
      List.joins(:user).where(user_id: [self.id, self.partner.id])
    else
      lists
    end
  end
end