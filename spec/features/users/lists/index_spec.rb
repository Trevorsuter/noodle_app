require 'rails_helper'

RSpec.describe 'user lists index page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    
    @groceries = @user1.lists.create!(name: "Groceries")
    @movies = @user1.lists.create!(name: "Movies to Watch")
    @places = @user1.lists.create!(name: "Places to Visit")
    
    visit root_path
    fill_in "email", with: "#{@user1.email}"
    fill_in "password", with: "#{@user1.password}"
    click_button 'login'
    visit user_lists_path(@user1)
  end

  it 'has a button to create a lew list' do

    expect(page).to have_button("Create a List")

    click_button "Create a List"

    expect(current_path).to eq(new_user_list_path(@user1.id))
  end
  
  it 'displays all of the users lists'
  
  it 'each list displays its tasks'
end