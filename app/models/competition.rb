class Competition < ApplicationRecord
  has_many :games
  has_many :participants, through: :games
  has_many :users, through: :participants

  validates_presence_of :name
  validates_presence_of :score_type
  enum score_type: [ :wins, :points ]
end