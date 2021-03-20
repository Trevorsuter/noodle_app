require 'rails_helper'

RSpec.describe 'new list task page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    @groceries = @user1.lists.create!(name: "Groceries")
    @housekeeping = @user1.lists.create!(name: "Housekeeping")
    
    login(@user1)
    visit new_list_task_path(@groceries)
  end

  it 'has all of the correct forms' do

    expect(page).to have_field('task[name]')
    expect(page).to have_field('task[description]')
    expect(page).to have_field('task[due]')
    expect(page).to have_field('task[status]')
    expect(page).to have_button('Create Task')
  end

  it 'can create a new task' do
    fill_in 'task[name]', with: "Test Task"
    fill_in 'task[description]', with: "Test Task description"
    fill_in 'task[due]', with: "12/25/2021"
    fill_in 'task[status]', with: "incomplete"
    click_button 'Create Task'

    expect(current_path).to eq(user_dashboard_index_path(@user1))
    expect(page).to have_content("Test Task")
  end
end