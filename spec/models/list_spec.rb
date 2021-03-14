require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
    it {should have_many :list_tasks}
    it {should have_many(:tasks).through(:list_tasks)}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
  end
end