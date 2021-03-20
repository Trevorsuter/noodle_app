require 'rails_helper'

RSpec.describe 'competitions new page', type: :feature do
  before :each do
    @user1 = User.create!(name: "Alexis Sayles", birthday: DateTime.new(1998, 5, 13), email: "Alexissayles@colorado.edu", password: "password")
    @user2 = User.create!(name: "Trevor Suter", birthday: DateTime.new(1997, 2, 1), email: "Trevorsuter@icloud.com", password: "password")

    login(@user1)
    visit new_competition_path
  end

  it 'has all the correct forms' do
    expect(page).to have_field('competition[name]')
    expect(page).to have_field('competition[point_limit]')
    expect(page).to have_field('competition[score_type]')
    expect(page).to have_button('Create')
  end

  it 'can create a new competition' do
    fill_in 'competition[name]', with: 'Test Competition'
    fill_in 'competition[point_limit]', with: '10'
    click_button 'Create'

    expect(current_path).to eq(new_competition_game_path(Competition.first))
    expect(page).to have_content("Competition Created! Create a game to get started.")
  end
end