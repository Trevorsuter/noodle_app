require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should belong_to(:competition).optional }
    it { should have_many :participants }
    it { should have_many(:users).through(:participants) }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :winning_score }
  end

end