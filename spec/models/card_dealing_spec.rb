require 'rails_helper'

RSpec.describe CardDealing, type: :model do
  it { should belong_to :game }
  it { should belong_to :card }
  it { should belong_to :cardable }
end
