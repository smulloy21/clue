class Card < ActiveRecord::Base
  has_many :card_dealings

  has_many :card_possibles

  scope :weapons, -> { where(type: 'Weapon') }
  scope :rooms, -> { where(type: 'Room') }
  scope :suspects, -> { where(type: 'Suspect') }

  scope :weapon, -> { where(type: 'Weapon').first }
  scope :room, -> { where(type: 'Room').first }
  scope :suspect, -> { where(type: 'Suspect').first }
end
