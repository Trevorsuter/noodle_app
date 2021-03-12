require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Trevor Suter", email: "Trevorsuter@icloud.com", password: "Gosharks1", birthday: Date.new(1997, 2, 1))
    visit root_path
  end

  it 'has an option to create a new user' do

    expect(page).to have_link("Create one")

    click_link 'Create one'
    expect(current_path).to eq(new_user_path)
  end

  it 'has an option to login' do

    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('login')
  end

  it 'can login successfully' do

    fill_in 'email', with: 'Trevorsuter@icloud.com'
    fill_in 'password', with: 'Gosharks1'
    click_button 'login'

    expect(current_path).to eq(user_dashboard_index_path(@user1))
  end
  it 'gives a flash notice when login unsuccessful' do

    fill_in 'email', with: 'Trevorsuter@icloud.com'
    fill_in 'password', with: 'incorrectpassword'
    click_button 'login'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('login unsuccessful')
  end
end