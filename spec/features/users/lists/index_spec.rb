require 'rails_helper'

RSpec.describe 'user lists index page', type: :feature do
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
  
  describe 'lists' do
    it 'are all displayed' do

      within("#lists") do
        expect(page).to_not have_content(@classwork.name)
        expect(page).to_not have_content(@garage.name)

        expect(page).to have_content(@groceries.name)
        expect(page).to have_content(@movies.name)
        expect(page).to have_content(@places.name)
      end
    end
    
    it 'display their tasks' do
      
      within("#list-#{@groceries.id}") do
        expect(page).to_not have_content(@tools.name)
        expect(page).to_not have_content(@dubai.name)

        expect(page).to have_content(@bananas.name)
      end
    end

    it 'has options to edit and delete, and create a new task' do
      within("#list-#{@groceries.id}") do
        expect(page).to have_button("#{@groceries.name}")
        expect(page).to have_link('Edit')
        expect(page).to have_link('Delete')
        expect(page).to have_link('Create A Task')
      end
    end

    it 'can be deleted' do
      within("#list-#{@groceries.id}") do
        click_link 'Delete'
      end

      expect(current_path).to eq(user_lists_path(@user1))
      within ("#lists") do
        expect(page).to_not have_content(@groceries.name)

        expect(page).to have_content(@places.name)
      end
    end
  end
end