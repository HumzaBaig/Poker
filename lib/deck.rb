require_relative 'card'

SUITS = [:heart, :spade, :club, :diamond]
VALUES = [:ace, 2,3,4,5,6,7,8,9,10, :jack, :queen, :king]

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

end
