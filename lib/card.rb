class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def number_value
    return @value if @value.is_a?(Integer)
    special_cards = { ace: [1, 14], jack: 11, queen: 12, king: 13 }
    special_cards[@value]
  end
end
