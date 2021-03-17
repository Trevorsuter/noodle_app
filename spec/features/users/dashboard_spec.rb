require 'rails_helper'

RSpec.describe 'user dashboard index spec', type: :feature do
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
    visit user_dashboard_index_path(@user1)
  end

  it 'has a form to add a partner when one isnt assigned' do
    expect(page).to have_field('partner_email')
    expect(page).to have_button("Request")
  end

  it 'can submit a request for a partner' do
    fill_in 'partner_email', with: 'Alexissayles@colorado.edu'
    click_button 'Request'

    expect(page).to have_content("Partner Request submitted! Waiting on their approval.")
    expect(current_path).to eq(user_dashboard_index_path(@user1.id))
  end

  it 'can field a request from a partner' do
    PartnerRequest.create!(user: @user2, partner: @user1)
    visit user_dashboard_index_path(@user1)

    expect(page).to have_content("You have a new request from #{@user2.name}!")
    expect(page).to have_button("Accept")
    expect(page).to have_button("Reject")
  end

  it 'can accept a request' do
    PartnerRequest.create!(user: @user2, partner: @user1)
    visit user_dashboard_index_path(@user1)
    click_button 'Accept'

    expect(page).to_not have_field('partner_email')
    expect(page).to_not have_button('Request')
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user2.birthday)
    expect(page).to have_content(@user2.email)
  end
end