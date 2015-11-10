require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to :game }
  it { should have_many :card_dealings }
  it { should have_many :cards }

  it { should have_many :card_possibles }
  it { should have_many :possible_cards }

  it { should have_one :player_location }
  it { should have_one :current_room }
end
