class Player < ActiveRecord::Base
  belongs_to :game
  has_many :card_dealings, as: :cardable
  has_many :cards, through: :card_dealings

  has_many :guesses, dependent: :destroy
  has_one :accusation, dependent: :destroy
  has_many :card_selections, dependent: :destroy


  scope :user, -> { where(user: true).first }
  scope :opponents, -> { where(user: false) }

end
