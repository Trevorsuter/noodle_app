require 'rails_helper'

RSpec.describe 'new list task page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    @groceries = @user1.lists.create!(name: "Groceries")
    @housekeeping = @user1.lists.create!(name: "Housekeeping")
    
    visit root_path
    fill_in "email", with: "#{@user1.email}"
    fill_in "password", with: "#{@user1.password}"
    click_button 'login'
    visit new_list_task_path(@groceries)
  end

  it 'has all of the correct forms' do

    expect(page).to have_field('task[name]')
    expect(page).to have_field('task[description]')
    expect(page).to have_field('task[due]')
    expect(page).to have_field('task[status]')
    expect(page).to have_button('Create Task')
  end
end