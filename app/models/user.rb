class User < ApplicationRecord
  belongs_to :partner, foreign_key: :partner_id, class_name: 'User', inverse_of: :partner, optional: true
  has_many :lists

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :birthday
  validates_presence_of :password, require: true

  has_secure_password
end