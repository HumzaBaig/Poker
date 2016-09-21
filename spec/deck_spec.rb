require 'deck'

describe Deck do
  subject(:deck) { Deck.new() }

  describe "#initialize" do
    it "has 52 cards" do
      expect(deck.deck.length).to eq(52)
    end
  end

  describe "#shuffle!" do
    before(:each) do
      @intial_deck = deck.deck
    end
    it "shuffles the deck" do
      expect(deck.shuffle!).to_not eq(@initial_deck)
    end
  end
end
