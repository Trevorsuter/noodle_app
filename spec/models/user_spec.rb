require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should belong_to(:partner).optional }
    it { should have_many :lists }
    it { should have_many :partner_requests }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :birthday }
  end

  it 'can create a new record without a partner' do
    @user1 = User.create!(name: "Trevor Suter", email: "Trevorsuter@icloud.com", password: "password", birthday: Date.new(1997, 2, 1))

    expect(@user1.class).to eq(User)
    expect(@user1.name).to eq("Trevor Suter")
    expect(@user1.email).to eq("Trevorsuter@icloud.com")
    expect(@user1.password).to eq("password")
    expect(@user1.birthday.to_s).to eq("1997-02-01")
    expect(@user1.partner).to be_nil
  end

  describe 'instance methods' do
    before :each do
      @user1 = User.create!(name: "Trevor Suter", birthday: DateTime.new(1997, 2, 1), email: "Trevorsuter@icloud.com", password: "password")
      @user2 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
      @user3 = User.create!(name: "Frank Daidone", birthday: DateTime.new(2001, 1, 1), email: "Frankdaidone@gmail.com", password: "password")
      @pr1 = @user1.partner_requests.create!(partner: @user2)
      @pr2 = @user2.partner_requests.create!(partner: @user3)
      @pr3 = @user3.partner_requests.create!(partner: @user2)
    end
    it 'incoming_requests_by_most_recent' do
      
      expect(@user1.incoming_requests_with_names).to eq([])
      expect(@user1.partner_requests).to eq([@pr1])
      expect(@user2.incoming_requests_with_names).to eq([@pr1, @pr3])
      expect(@user2.partner_requests).to eq([@pr2])
      expect(@user3.incoming_requests_with_names).to eq([@pr2])
      expect(@user3.partner_requests).to eq([@pr3])
    end
  end
end