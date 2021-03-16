require 'rails_helper'

RSpec.describe 'user list new page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    @user2 = User.create!(name: "Trevor Suter", birthday: DateTime.new(1997, 2, 1), email: "Trevorsuter@icloud.com", password: "password")
    
    @groceries = @user1.lists.create!(name: "Groceries")
    @movies = @user1.lists.create!(name: "Movies to Watch")
    @places = @user1.lists.create!(name: "Places to Visit")
    @classwork = @user2.lists.create!(name: "Classwork")
    @garage = @user2.lists.create!(name: "Garage")

    @bananas = Task.create!(name: "Bananas", description: "Make sure they're fresh!", due: Date.today, status: "incomplete")
    @tools = Task.create!(name: "Organize Tools", description: "By size", due: Date.today, status: "incomplete")
    @dubai = Task.create!(name: "Dubai", status: "incomplete")

    ListTask.create!(list: @groceries, task: @bananas)
    ListTask.create!(list: @garage, task: @tools)
    ListTask.create!(list: @places, task: @dubai)
    
    login(@user1)
    visit new_user_list_path(@user1)
  end
  
  it 'has the correct forms for a list' do

    expect(page).to have_field('name')
    expect(page).to have_button('create')
  end

  it 'can create a new list' do
    fill_in :name, with: "New List Created"
    click_button 'create'

    expect(current_path).to eq(user_lists_path(@user1.id))
    within("#lists") do
      expect(page).to have_content("New List Created")
    end
  end

  it 'will not create a new list if a name isnt given' do
    click_button 'create'

    expect(page).to have_content("Please fill in a name.")
    expect(page).to have_field('name')
    expect(page).to have_button('create')
  end
end