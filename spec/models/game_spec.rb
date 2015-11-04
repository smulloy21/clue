require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_one :answer }
  it { should have_many :card_dealings }
  it { should have_many :cards }
end
