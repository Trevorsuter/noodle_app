require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'relationships' do
    it {should have_many :list_tasks}
    it {should have_many(:lists).through(:list_tasks)}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :status}
  end
end