class Player < ActiveRecord::Base
  belongs_to :game
  has_many :card_dealings, as: :cardable
  has_many :cards, through: :card_dealings

  has_many :guesses, dependent: :destroy
  has_one :accusation, dependent: :destroy
  has_many :card_selections, dependent: :destroy

  has_many :card_possibles, dependent: :destroy
  has_many :possible_cards, through: :card_possibles, source: :card

  scope :user, -> { where(user: true).first }
  scope :opponents, -> { where(user: false) }

  def take_turn
    self.guesses.create()
    self.guesses.last.card_selections.push(CardSelection.create(card_id: self.possible_cards.weapons.offset(rand(self.possible_cards.weapons.count)).first.id))
    self.guesses.last.card_selections.push(CardSelection.create(card_id: self.possible_cards.rooms.offset(rand(self.possible_cards.rooms.count)).first.id))
    self.guesses.last.card_selections.push(CardSelection.create(card_id: self.possible_cards.suspects.offset(rand(self.possible_cards.suspects.count)).first.id))
  end

end
