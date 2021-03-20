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
      @user4 = User.create!(name: "Maddie Suter", birthday: DateTime.new(1993, 10, 2), email: "Maddie.suter@gmail.com", password: "password")
      @user5 = User.create!(name: "Meredith Suter", birthday: DateTime.new(1967, 2, 6), email: "Msuter@ngkf.com", password: "password")
      @user6 = User.create!(name: "Sergio Casteneda", birthday: DateTime.new(1962, 1, 25), email: "Sergiocasteneda@cbre.com", password: "password")
      @user5.partner = @user6
      @user6.partner = @user5

      @u4_list1 = @user4.lists.create!(name: "user 4 list 1")
      @u4_list2 = @user4.lists.create!(name: "user 4 list 2")
      @u5_list1 = @user5.lists.create!(name: "Grocery list")
      @u5_list2 = @user5.lists.create!(name: "Cooking")
      @u6_list1 = @user6.lists.create!(name: "Backyard")
      @u6_list2 = @user6.lists.create!(name: "Garage")

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

    it 'pending_request?' do
      expect(@user1.pending_request?).to eq(true)
      expect(@user4.pending_request?).to eq(false)
      expect(@user5.pending_request?).to eq(false)
      expect(@user6.pending_request?).to eq(false)
    end

    it 'pending_requests' do
      expect(@user1.pending_requests).to eq([@user2])
      expect(@user2.pending_requests).to eq([@user3])
      expect(@user3.pending_requests).to eq([@user2])
      expect(@user4.pending_requests).to eq([])
    end

    it 'combined_lists' do
      expected = [@u5_list1, @u5_list2, @u6_list1, @u6_list2]
      
      expect(@user5.combined_lists.sort).to eq(expected.sort)
      expect(@user4.combined_lists.sort).to eq(@user4.lists.sort)
    end
  end
end