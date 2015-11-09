class Game < ActiveRecord::Base
  after_create :deal

  has_one :answer, dependent: :destroy
  has_many :card_dealings, dependent: :destroy
  has_many :cards, through: :card_dealings
  has_many :players, dependent: :destroy

  def next_turn
    self.turn < self.players.length - 1 ? self.update(turn: self.turn + 1) : self.update(turn: 0)
  end
  private

  def deal
    suspects = Suspect.all
    rooms = Room.all
    weapons = Weapon.all

    # create players
    suspects.each do |suspect|
      self.players << Player.create(name: suspect.name, img: suspect.img, game_id: self.id)
    end

    # create random answer
    answer = Answer.create(game_id: self.id)

    who = suspects.shuffle.pop
    answer.card_dealings << CardDealing.create(card_id: who.id, game_id: self.id)
    where = rooms.shuffle.pop
    answer.card_dealings << CardDealing.create(card_id: where.id, game_id: self.id)
    how = weapons.shuffle.pop
    answer.card_dealings << CardDealing.create(card_id: how.id, game_id: self.id)

    # deal remaining cards to players
    cards = (suspects - [who]) + (rooms - [where]) + (weapons - [how])

    self.players.each do |player|
      3.times do
        card = cards.shuffle.pop
        player.card_dealings << CardDealing.create(card_id: card.id, game_id: self.id)
        cards = (cards - [card])
      end
      possible_cards = Card.all - player.cards
      possible_cards.each do |card|
        player.card_possibles << CardPossible.create(card_id: card.id)
      end
    end
  end


end
