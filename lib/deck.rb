require_relative 'card'

SUITS = [:heart, :spade, :club, :diamond]
VALUES = [2,3,4,5,6,7,8,9,10, :jack, :queen, :king, :ace]

class Deck
  attr_reader :deck

  def initialize
    @deck = []
    fill_deck
  end

  def fill_deck
    SUITS.each do |suit|
      VALUES.each { |value| @deck << Card.new(suit, value) }
    end
  end

  def shuffle!
    @deck.shuffle!
  end

  def add_card(card)
    @deck << card
  end

end
