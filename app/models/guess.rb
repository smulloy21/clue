class Guess < ActiveRecord::Base
  belongs_to :player
  has_many :card_selections, as: :guessable
  has_many :cards, through: :card_selections
end
