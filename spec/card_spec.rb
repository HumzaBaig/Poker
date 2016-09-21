require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:heart, 10) }

  describe "#intialize" do
    it "has a suit" do
      expect([:heart, :spade, :club, :diamond]).to include card.suit
    end

    it "has a value" do
      expect([:ace, 2,3,4,5,6,7,8,9,10, :jack, :queen, :king]).to include card.value
    end
  end
end
