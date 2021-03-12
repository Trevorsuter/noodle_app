class User < ApplicationRecord
  belongs_to :partner, :foreign_key => :partner_id, :class_name => 'User', :inverse_of => :partner, optional: true

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :birthday
  validates_presence_of :password
end