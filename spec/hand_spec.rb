require 'hand'
require 'card'
require 'deck'

describe Hand do
  subject(:hand) { Hand.new(Deck.new()) }

  describe "#intialize" do
    it "has five cards" do
      expect(hand.hand.length).to eq(5)
    end
  end

  describe "#best_hand" do
    it "returns 'royal flush' on an unshuffled deck" do
      expect(hand.best_hand).to eq("royal flush")
    end

    let(:d) { Deck.new() }
    it "returns 'no pair' when you have nothing" do
      d.add_card(Card.new(:diamond, 3))
      d.add_card(Card.new(:spade, 7))
      d.add_card(Card.new(:diamond, 5))
      d.add_card(Card.new(:club, :jack))

      subject(:hand_no_pair) { Hand.new(d) }
      expect(hand_no_pair.best_hand).to eq("no pair")
    end

    it "returns 'two pair' when you have two pairs" do
      d.add_card(Card.new(:heart, :ace))
      d.add_card(Card.new(:club, :king))
      subject(:hand_two_pair) {Hand.new(d)}
      expect(hand_two_pair.best_hand).to eq("two pair")
    end
  end
end
