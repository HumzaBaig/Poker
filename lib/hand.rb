require_relative 'deck'
require 'byebug'

class Hand
  attr_accessor :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    deal
  end

  def deal
    5.times { @hand << @deck.deck.pop }
  end

  def best_hand
    Hand.hands.each do |method|
      m = method.call(@hand)
      return m if m
    end
  end

  private
  def self.royal_flush(hand)
    matching_suit = matching_suits?(hand)
    return nil unless matching_suit

    all_royals = hand.all? do |card|
      royals = [:king, :queen, :jack, 10, :ace]
      royals.include?(card.value)
    end
    return nil unless all_royals

    "royal flush"
  end

  def self.straight_flush(hand)
    return "straight flush" if sequential?(hand)
    nil
  end

  def self.four_of_a_kind(hand)
    return "four of a kind" if of_a_kind(hand, 4) == [4]
    nil
  end

  def self.full_house(hand)
    return "full house" if of_a_kind(hand, 3) == [3] && of_a_kind(hand, 2) == [2]
    nil
  end

  def self.flush(hand)
    return "flush" if hand.matching_suits?(hand)
    nil
  end

  def self.straight(hand)
    return "straight" if hand.sequential?(hand)
    nil
  end

  def self.three_of_a_kind(hand)
    return "three of a kind" if of_a_kind(hand, 3) == [3]
  end

  def self.two_pair(hand)
    return "two pair" if of_a_kind(hand, 2) == [2, 2]
  end

  def self.one_pair(hand)
    return "one pair" if of_a_kind(hand, 2) == [2]
  end

  def self.no_pair(hand)
    "no pair"
  end

  def self.of_a_kind(hand, num)
    count = Hash.new(0)
    hand.each { |card| count[card.value] += 1 }

    result = []
    count.values.each { |val| result << value if val == num }
    result
  end

  def self.matching_suits?(hand)
    ref_suit = hand.first.suit
    hand.all? { |card| card.suit == ref_suit}
  end

  def self.number_values(hand)
    values = hand.map { |card| card.number_value }
    values.flatten!
    values.sort!
  end

  def self.sequential?(hand)
    values = Hand.number_values(hand)
    min, max = values.min, values.max

    if values.length == 6
      first_five = values[0...-1]
      ff_max = values[-2]
      return true if first_five == (min..ff_max).to_a

      last_five = values[1..-1]
      lf_min = values[1]
      return true if last_five == (lf_min..max).to_a
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
