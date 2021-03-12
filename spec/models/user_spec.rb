require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should belong_to(:partner).optional }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :birthday }
  end

  it 'can create a new record without a partner' do
    @user1 = User.create!(name: "Trevor Suter", email: "Trevorsuter@icloud.com", birthday: Date.new(1997, 2, 1))

    expect(@user1.class).to eq(User)
    expect(@user1.name).to eq("Trevor Suter")
    expect(@user1.email).to eq("Trevorsuter@icloud.com")
    expect(@user1.birthday.to_s).to eq("1997-02-01")
    expect(@user1.partner).to be_nil
  end
end