class CardDealing < ActiveRecord::Base
  belongs_to :game
  belongs_to :cardable, polymorphic: true
  belongs_to :card
end
