require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to :game }
  it { should have_many :card_dealings }
  it { should have_many :cards }
end
