class Player < ActiveRecord::Base
  belongs_to :game
  has_many :card_dealings, as: :cardable
  has_many :cards, through: :card_dealings

  has_many :guesses, dependent: :destroy
  has_one :accusation, dependent: :destroy
  has_many :card_selections, dependent: :destroy

  has_many :card_possibles, dependent: :destroy
  has_many :possible_cards, through: :card_possibles, source: :card

  has_one :player_location, dependent: :destroy
  has_one :current_room, through: :player_location, source: :room

  scope :user, -> { where(user: true).first }
  scope :opponents, -> { where(user: false) }

  def take_turn
    self.current_room = self.current_room.next_rooms.sample
    self.guesses.create()
    self.guesses.last.card_selections.push(CardSelection.create(card_id: self.possible_cards.weapons.offset(rand(self.possible_cards.weapons.count)).first.id))
    self.guesses.last.card_selections.push(CardSelection.create(card_id: self.current_room.id))
    self.guesses.last.card_selections.push(CardSelection.create(card_id: self.possible_cards.suspects.offset(rand(self.possible_cards.suspects.count)).first.id))
  end

  def disprove_guess(guess)
    if (self.cards & guess.cards).empty?
      false
    else
      (self.cards & guess.cards).sample
    end
  end

  def next_player
     next_player = (self.name == 'Professor Plum' ? Player.find(self.id - 5) : Player.find(self.id + 1))
  end

end
