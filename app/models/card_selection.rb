class CardSelection < ActiveRecord::Base
  belongs_to :player
  belongs_to :guessable, polymorphic: true
  belongs_to :card
end
