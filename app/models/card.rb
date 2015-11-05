class Card < ActiveRecord::Base
  has_many :card_dealings

  scope :weapon, -> { where(type: 'Weapon').first }
  scope :room, -> { where(type: 'Room').first }
  scope :suspect, -> { where(type: 'Suspect').first }
end
