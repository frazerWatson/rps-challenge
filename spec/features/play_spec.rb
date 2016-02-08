require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors

feature 'playing the game' do
  before do
    visit('/')
    fill_in 'name', with: 'Ninja'
    click_button 'Submit'
  end
  # As a marketeer
  # So I can play a game
  # I want to see the options I can play
  scenario 'see the weapon options' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

   # As a marketeer
  # So I can play a game
  # I want to choose a weapon to play

  scenario 'choose a weapon' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock'
  end


end