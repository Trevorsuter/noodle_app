require 'rails_helper'

RSpec.describe PartnerRequest, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :partner }
  end

end