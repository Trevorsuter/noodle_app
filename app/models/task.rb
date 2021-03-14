class Task < ApplicationRecord
  has_many :list_tasks
  has_many :lists, through: :list_tasks
  validates_presence_of :name
  validates_presence_of :status
  enum status: [:incomplete, :complete]
end