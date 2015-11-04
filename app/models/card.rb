class Card < ActiveRecord::Base
  has_many :card_dealings
end
