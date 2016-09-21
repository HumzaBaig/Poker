require_relative 'deck'
require 'byebug'

class Hand
  attr_reader :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    deal
  end

  def deal
    5.times { @hand << @deck.deck.pop }
  end

  def compare_hands
    Hand.hands.each do |method|
      return method.call if method
    end
  end

  def royal_flush
    matching_suit = matching_suits?
    return nil unless matching_suit

    all_royals = @hand.all? do |card|
      royals = [:king, :queen, :jack, 10, :ace]
      royals.include?(card.value)
    end
    return nil unless all_royals

    @hand
  end

  def straight_flush

  end

  def four_of_a_kind
  end

  def full_house
  end

  def flush
  end

  def straight
  end

  def three_of_a_kind
  end

  def two_pair
  end

  def one_pair
  end

  def no_pair
  end

  def matching_suits?
    ref_suit = @hand.first.suit
    @hand.all? { |card| card.suit == ref_suit}
  end

  def number_values
    values = @hand.map { |card| card.number_value }
    values.flatten!
    values.sort!
  end

  def sequential?(values = self.number_values)
    min, max = values.min, values.max
    if values.length > 5
      return sequential?(values.drop(1)) || sequential?(values.take(5))
    end
    (min..max).to_a == values
  end

  def self.hands
    [method(:royal_flush), method(:straight_flush),
    method(:four_of_a_kind), method(:full_house),
    method(:flush), method(:straight), method(:three_of_a_kind),
    method(:two_pair), method(:one_pair), method(:no_pair)]
  end
end

d = Deck.new
d.shuffle!
h = Hand.new(d)
p h.number_values
p h.sequential?
