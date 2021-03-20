require 'rails_helper'

RSpec.describe 'new game view', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    @competition = Competition.create!(name: "Test Competition", point_limit: 10)

    login(@user1)
    visit new_competition_game_path(@competition)
  end

  it 'has all the correct fields' do
    expect(page).to have_field('game[name]')
    expect(page).to have_field('game[winning_score]')
    expect(page).to have_button("Create")
  end

  it 'can create a new game' do
    fill_in 'game[name]', with: 'Test Game'
    fill_in 'game[winning_score]', with: '150'
    click_button 'Create'

    expect(current_path).to eq(user_competition_path(@user1, @competition))
    expect(page).to have_content("Game created. Good luck, soldier!")
  end

  it 'wont create a new game without information' do
    click_button 'Create'
    expect(page).to have_content("You forgot some information. Try again.")
  end
end