require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should have_many :adjoining_rooms }
  it { should have_many :next_rooms }
end
