require 'rails_helper'

RSpec.describe 'include rails helper module' do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    stub(:login).and_return('available')
  end

  it 'includes the login helper' do
    expect(login(@user1)).to eq('available')
  end
end