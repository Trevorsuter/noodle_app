require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Trevor Suter", email: "Trevorsuter@icloud.com", password: "Gosharks1", birthday: Date.new(1997, 2, 1))
    visit welcome_path
  end

  it 'has an option to create a new user' do

    expect(page).to have_link("Create one")

    click_link 'Create one'
    expect(current_path).to eq(new_user_path)
  end

  it 'has an option to login' do

    expect(page).to have_field('Email:')
    expect(page).to have_field('Password:')

  end
end