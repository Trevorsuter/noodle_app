require 'rails_helper'

RSpec.describe 'new user page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")

    visit new_user_path
  end

  it 'has all the correct forms' do

    expect(page).to have_field('user[name]')
    expect(page).to have_field('user[birthday]')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Create your Profile!')
  end

  it 'can create a new user' do
    fill_in 'user[name]', with: "Trevor Suter"
    fill_in 'user[birthday]', with: "02/01/1997"
    fill_in 'user[email]', with: "Trevorsuter@icloud.com"
    fill_in 'user[password]', with: "password"
    click_button 'Create your Profile!'

    new_user = User.where(name: "Trevor Suter").first
    expect(current_path).to eq(user_dashboard_index_path(new_user))
    expect(page).to have_content('')
  end

  it 'cannot create a new user without completing all fields'

  it 'cannot create a user with a taken account email'

  it 'redirects to the new users dashboard after successful creation'
end