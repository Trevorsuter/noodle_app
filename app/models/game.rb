class Game < ApplicationRecord
  belongs_to :competition, optional: true
  has_many :participants
  has_many :users, through: :participants

  validates_presence_of :name
  validates_presence_of :winning_score
end