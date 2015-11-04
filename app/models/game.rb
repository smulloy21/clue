class Game < ActiveRecord::Base
  after_create :deal

  has_one :answer, dependent: :destroy
  has_many :card_dealings, dependent: :destroy
  has_many :cards, through: :card_dealings

  private
  def deal
    suspects = Suspect.all
    rooms = Room.all
    weapons = Weapon.all

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

    cards.each do |card|
      self.card_dealings << CardDealing.create(card_id: card.id)
    end
  end
  
  #   get all cards
  #   deal one of each type to answer
  #   deal the remaining ones out to players randomly
end
