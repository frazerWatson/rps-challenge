require 'spec_helper'

PLAY_SEED = 221563
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

  # As a marketeer
  # So I can play a game
  # I want the game to choose an option

  scenario 'game chooses "Rock"' do
    click_button 'Rock'
  
    message = find(:css, "#opponent").text.strip

    expect(possible_messages).to include message

  end

   # As a marketeer
  # So I can play a game
  # I want the game to choose a random option

  scenario 'game chooses a random option' do
    srand(PLAY_SEED)
    click_button 'Rock'
    expect(page).to have_content 'Opponent chose Scissors'
  end

  def possible_messages
    [:rock, :paper, :scissors].map { |weapon| "Opponent chose #{weapon.to_s.capitalize}"}
  end



end