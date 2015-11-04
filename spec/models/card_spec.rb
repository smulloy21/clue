require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should have_many :card_dealings }
end
