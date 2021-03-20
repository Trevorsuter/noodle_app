require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'relationships' do
    it { should belong_to :game }
    it { should belong_to :user }
  end
  describe 'validations' do
  end

end