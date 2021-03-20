require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many :games }
    it { should have_many :participants }
    it { should have_many(:users).through(:participants) }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :score_type }
  end

end