require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Trevor Suter", email: "Trevorsuter@icloud.com", password: "Gosharks1", birthday: Date.new(1997, 2, 1))
    visit "/"
  end

  it 'has an option to create a new user' do
    
    expect(page).to have_Link("Create New User")
  end

  it 'has an option to login'
end