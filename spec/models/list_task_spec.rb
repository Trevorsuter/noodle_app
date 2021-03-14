require 'rails_helper'

RSpec.describe ListTask, type: :model do
  describe 'relationships' do
    it {should belong_to :list}
    it {should belong_to :task}
  end
end