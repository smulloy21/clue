require 'rails_helper'

RSpec.describe Guess, type: :model do
  it { should have_many :card_selections }
  it { should have_many :cards }
end
