require 'rails_helper'

describe 'the create game process' do
  it 'creates a game' do
    visit new_game_path
    click_on 'Mr. Green'
    expect(page).to have_content "Miss Scarlet"
  end
end
