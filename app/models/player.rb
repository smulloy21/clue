class Player < ActiveRecord::Base
  belongs_to :game
  has_many :card_dealings, as: :cardable
  has_many :cards, through: :card_dealings


  scope :user, -> { where(user: true).first }
  scope :opponents, -> { where(user: false) }
end
