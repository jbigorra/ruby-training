module Blackjack
  CARD_VALUES = Hash[
    'ace',    11,
    'two',    2,
    'three',  3,
    'four',   4,
    'five',   5,
    'six',    6,
    'seven',  7,
    'eight',  8,
    'nine',   9,
    'ten',    10,
    'jack',   10,
    'queen',  10,
    'king',   10,
  ]
  
  def self.parse_card(card)
    return 0 unless CARD_VALUES.key?(card)
    return CARD_VALUES[card]
  end

  def self.card_range(card1, card2)
    score = parse_card(card1) + parse_card(card2)
    
    case score
      when 4..11 then "low"
      when 12..16 then "mid"
      when 17..20 then "high"
      when 21 then "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    case
      when card_range(card1, card2).nil? then "P"
      when card_range(card1, card2) == "blackjack"
        if ["ace", "ten", "jack", "queen", "king"].include?(dealer_card) then "S"
        else "W"
        end
      when card_range(card1, card2) == "high" then "S"
      when card_range(card1, card2) == "mid"
        if parse_card(dealer_card) >= 7 then "H"
        else "S"
        end
      when card_range(card1, card2) == "low" then "H"
    end
  end
end
