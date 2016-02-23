require 'time'

class Card
  attr_accessor :rank, :suit, :value
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = self.get_value(rank)
  end

  def initialize(card)
    @rank = card[0]
    @suit = card[1]
    @value = self.get_value(@rank)
  end

  def get_value
    return @value
  end

  def get_value(rank)
    case rank
    when "T"
      return 10
    when "J"
      return 11
    when "Q"
      return 12
    when "K"
      return 13
    when "A"
      return 14
    else
      return rank.to_i
    end
  end

  def to_s
    case @rank
    when "T", "t"
      rank = "10"
    when "J", "j"
      rank = "Jack"
    when "Q", "q"
      rank = "Queen"
    when "K", "k"
      rank = "King"
    when "A", "a"
      rank = "Ace"
    else
      rank = @rank
    end

    case @suit
    when "H", "h"
      suit = "Hearts"
    when "D", "d"
      suit = "Diamonds"
    when "S", "s"
      suit = "Spades"
    when "C", "c"
      suit = "Clubs"
    else
      suit = "Unknown suit"
    end

    "#{rank} of #{suit}"
  end

  def <(card)
    @value < card.value
  end

  def >(card)
    @value > card.value
  end

end

class Hand
  attr_accessor :cards
  def initialize(cards)
    card_array = []
    cards.each do |card|
      card_array << Card.new(card)
    end
    @cards = card_array
  end

  def values
    values = []
    @cards.each do |card|
      values << card.value
    end
    return values.sort.reverse
  end

  def suits
    suits = []
    @cards.each do |card|
      suits << card.suit
    end
    return suits
  end

  def flush?
    self.suits.uniq.size == 1
  end

  def royal?
    self.values == [14,13,12,11,10]
  end

  def straight?
    min = self.values.min
    values = []
    self.values.each do |value|
      values << value-min
    end
    values == [4,3,2,1,0]
  end

  def full_house?
    self.sets[0][0] == 3 && self.sets[1][0] == 2
  end

  def four_oak?
    self.sets[0][0] == 4
  end

  def three_oak?
    self.sets[0][0] == 3
  end

  def two_oak?
    self.sets[0][0] == 2
  end

  def two_pair?
    self.sets[0][0] == 2 && self.sets[1][0] == 2
  end

  def get_rank(value)
    case value
    when 10
      return 10
    when 11
      return "Jack"
    when 12
      return "Queen"
    when 13
      return "King"
    when 14
      return "Ace"
    else
      return value.to_s
    end
  end

  # returns the occurences of a value and the value itself in the hand
  def sets
    sets = []
    self.values.each do |value|
      sets << [self.values.count(value), value]
    end
    return sets.sort.reverse.uniq
  end

  def high_set
    sets = self.sets
    return sets[0][1] if sets[0][0] > 1
  end

  def low_set
    sets = self.sets
    return sets[1][1] if (sets[0][0] > 1) && (sets [1][0] > 1)
  end

  def high_card
    sets = self.sets
    vals = []
    sets.each do |set|
      vals << set[1] if set[0] == 1
    end
    return vals.max
  end

  def high_card
    sets = self.sets
    vals = []
    sets.each do |set|
      vals << set[1] if set[0] == 1
    end
    return vals.sort.reverse[1]
  end

  def hand_type
    values = self.values
    sets = self.sets
    #p values
    #p sets
    if self.royal? && self.flush?
      return "Royal flush"
    end
    if self.flush? && self.straight?
      return "Straight flush: #{self.get_rank(values.max)} high"
    end
    if self.four_oak?
      return "Four #{self.get_rank(sets[0][1])}s with #{self.get_rank(sets[1][1])} high"
    end
    if self.full_house?
      return "Full house: 3 #{self.get_rank(sets[0][1])}s and 2 #{self.get_rank(sets[1][1])}s"
    end
    if self.flush?
      return "Flush: #{self.get_rank(values.max)} high"
    end
    if self.straight?
      return "Straight: #{self.get_rank(values.max)} high"
    end
    if self.three_oak?
      subsets = [sets[1][1], sets[2][1]]
      return "Three #{self.get_rank(sets[0][1])}s with #{self.get_rank(subsets.max)} high"
    end
    if self.two_pair?
      subsets = [sets[0][1], sets[1][1]]
      return "Two #{self.get_rank(subsets.max)}s and two #{self.get_rank(subsets.min)}s with #{self.get_rank(sets[2][1])} high"
    end
    if self.two_oak?
      subsets = [sets[1][1], sets[2][1], sets[3][1]]
      return "Two #{self.get_rank(sets[0][1])}s with #{self.get_rank(subsets.max)} high"
    end
    return "#{self.get_rank(values.max)} high with #{self.get_rank(values[1])} second highest"
  end

  def win?(hand)
    h1_values = self.values
    h1_sets = self.sets
    h2_values = hand.values
    h2_sets = hand.sets

    h1_type = 0
    h1_high_set = 0
    h1_low_set = 0
    h1_high_card = 0
    h1_low_card = 0
    h2_type = 0
    h2_high_set = 0
    h2_low_set = 0
    h2_high_card = 0
    h2_low_card = 0

    if self.royal? && self.flush?
      h1_type = 9
      h1_high_card = h1_values.max
      h1_low_card = h1_values[1]
    elsif self.straight? && self.flush?
      h1_type = 8
      h1_high_card = h1_values.max
      h1_low_card = h1_values[1]
    elsif self.four_oak?
      h1_type = 7
      h1_high_set = h1_sets[0][1]
      h1_high_card = h1_sets[1][1]
    elsif self.full_house?
      h1_type = 6
      h1_high_set = h1_sets[0][1]
      h1_low_set = h1_sets[1][1]
    elsif self.flush?
      h1_type = 5
      h1_high_card = h1_values.max
      h1_low_card = h1_values[1]
    elsif self.straight?
      h1_type = 4
      h1_high_card = h1_values.max
      h1_low_card = h1_values[1]
    elsif self.three_oak?
      h1_type = 3
      h1_high_set = h1_sets[0][1]
      subsets = [h1_sets[1][1], h1_sets[2][1]]
      h1_high_card = subsets.max
      h1_low_card = subsets.min
    elsif self.two_pair?
      h1_type = 2
      subsets = [h1_sets[0][1], h1_sets[1][1]]
      h1_high_set = subsets.max
      h1_low_set = subsets.min
      h1_high_card = h1_sets[2][1]
    elsif self.two_oak?
      h1_type = 1
      h1_high_set = h1_sets[0][1]
      subsets = [h1_sets[1][1], h1_sets[2][1], h1_sets[3][1]]
      h1_high_card = subsets.max
      subsets.delete(h1_high_card)
      h1_low_card = subsets.max
    else
      h1_type = 0
      h1_high_card = h1_values.max
      h1_low_card = h1_values[1]
    end

    if hand.royal? && hand.flush?
      h2_type = 9
      h2_high_card = h2_values.max
      h2_low_card = h2_values[1]
    elsif hand.straight? && hand.flush?
      h2_type = 8
      h2_high_card = h2_values.max
      h2_low_card = h2_values[1]
    elsif hand.four_oak?
      h2_type = 7
      h2_high_set = h2_sets[0][1]
      h2_high_card = h2_sets[1][1]
    elsif hand.full_house?
      h2_type = 6
      h2_high_set = h2_sets[0][1]
      h2_low_set = h2_sets[1][1]
    elsif hand.flush?
      h2_type = 5
      h2_high_card = h2_values.max
      h2_low_card = h2_values[1]
    elsif hand.straight?
      h2_type = 4
      h2_high_card = h2_values.max
      h2_low_card = h2_values[1]
    elsif hand.three_oak?
      h2_type = 3
      h2_high_set = h2_sets[0][1]
      subsets = [h2_sets[1][1], h2_sets[2][1]]
      h2_high_card = subsets.max
      h2_low_card = subsets.min
    elsif hand.two_pair?
      h2_type = 2
      subsets = [h2_sets[0][1], h2_sets[1][1]]
      h2_high_set = subsets.max
      h2_low_set = subsets.min
      h2_high_card = h2_sets[2][1]
    elsif hand.two_oak?
      h2_type = 1
      h2_high_set = h2_sets[0][1]
      subsets = [h2_sets[1][1], h2_sets[2][1], h2_sets[3][1]]
      h2_high_card = subsets.max
      subsets.delete(h2_high_card)
      h2_low_card = subsets.max
    else
      h2_type = 0
      h2_high_card = h2_values.max
      h2_low_card = h2_values[1]
    end

    if h1_type > h2_type
      return true
    elsif h1_type < h2_type
      return false
    else
      if h1_high_set > h2_high_set
        return true
      elsif h1_high_set < h2_high_set
        return false
      else
        if h1_low_set > h2_low_set
          return true
        elsif h1_low_set < h2_low_set
          return false
        else
          if h1_high_card > h2_high_card
            return true
          elsif h1_high_card < h2_high_card
            return false
          else
            if h1_low_card > h2_low_card
              return true
            elsif h1_low_card < h2_low_card
              return false
            #else do more tiebreaking
            end
          end
        end
      end
    end
  end

  def print
    puts @cards
  end

  def to_s
    puts @cards
  end
end

time = Time.now

# read in the hands
file = File.open("input_files/p054_poker.txt", "r")
arr = file.readlines[0..file.size]
p1_hands = []
p2_hands = []

# split the hands for player1 and player2
arr.each do |round|
  split_round = round.split(" ")
  p1_hands << split_round[0..4]
  p2_hands << split_round[5..9]
end

#p p1_hands
#p p2_hands

p1_wins = 0
p2_wins = 0
(0...p1_hands.size).each do |hand|
  hand1 = Hand.new p1_hands[hand]
  #puts hand1.hand_type
  hand2 = Hand.new p2_hands[hand]
  #puts hand2.hand_type
  #puts hand1.win?(hand2)
  #puts
  p1_wins += 1 if hand1.win?(hand2)
  p2_wins += 1 unless hand1.win?(hand2)
end
puts "Player 1 wins #{p1_wins} games"
puts "Player 2 wins #{p2_wins} games"
puts "#{Time.now-time} seconds elapsed"
