require 'time'

def flush?(hand)
  (hand[0][1] == hand[1][1]) & (hand[1][1] == hand[2][1]) & (hand[2][1] == hand[3][1]) & (hand[3][1] == hand[4][1])
end

def straight?(hand)
  num_hand = []
  hand.each do |val|
    if val.to_i != 0
      num_hand << val.to_i
    else
      if val == "T"
        num_hand << 10
      elsif val == "J"
        num_hand << 11
      elsif val == "Q"
        num_hand << 12
      elsif val == "K"
        num_hand << 13
      elsif val == "A"
        num_hand << 14
      end
    end
  end
  num_hand.sort!
  (0..3).each do |i|
    return false if (num_hand[i]+1) != num_hand[i+1]
  end
  return true
end

def royal?(hand)
  (hand.include?("T")) & (hand.include?("J")) & (hand.include?("Q")) & (hand.include?("K")) & (hand.include?("A"))
end

# return the card value of the character
def face_value(card)
  case card
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
    return card.to_i
  end
end

# return the character of the card value
def value_face(card)
  case card
  when 10
    return "T"
  when 11
    return "J"
  when 12
    return "Q"
  when 13
    return "K"
  when 14
    return "A"
  else
    return card
  end
end

def check_hand(hand)
  temp_hand = hand

  one_pair = false
  oak_3 = false
  oak_4 = false
  two_pair = false
  full_house = false
  high_card = 0
  low_set = 0
  high_set = 0

  hand.each do |card|
    if hand.count(card) == 2
      temp_hand.delete(card)
      one_pair = true
      high_set = face_value(card) if high_set == 0
      low_set = face_value(card) if low_set == 0
    elsif hand.count(card) == 3
      oak_3 = true
      high_set = face_value(card)
    elsif hand.count(card) == 4
      oak_4 = true
      high_set = face_value(card)
    else
      high_card = [face_value(card),high_card].max
    end

    temp_hand.each do |card|
      if one_pair
        if temp_hand.count(card) == 2
          two_pair = true
          one_pair = false
          high_set = [face_value(card),high_set].max
          low_set = [face_value(card),low_set].min
        elsif temp_hand.count(card) == 3
          high_set = face_value(card)
          full_house = true
          one_pair = false
          oak_3 = false
        else
          high_card = [face_value(card),high_card].max
        end
      end
    end
  end

  return one_pair, oak_3, oak_4, two_pair, full_house, high_card, high_set, low_set
end

def identify_hand(flush, straight, royal, oak4, oak3, oak2x2, oak2, fh, high_card, high_set, low_set)
  high_card = value_face(high_card)
  high_set = value_face(high_set)
  low_set = value_face(low_set)
  return "royal flush", [10,face_value(high_set),face_value(low_set),face_value(high_card)] if royal & flush
  return "straight flush high card #{high_card}", [9,face_value(high_set),face_value(low_set),face_value(high_card)] if straight & flush
  return "4 #{high_set}s, high card #{high_card}", [8,face_value(high_set),face_value(low_set),face_value(high_card)] if oak4
  return "full house with 3 #{high_set}s, and 2 #{low_set}s", [7,face_value(high_set),face_value(low_set),face_value(high_card)] if fh
  return "flush, high card #{high_card}", [6,face_value(high_set),face_value(low_set),face_value(high_card)] if flush
  return "straight high card #{high_card}", [5,face_value(high_set),face_value(low_set),face_value(high_card)] if straight
  return "3 #{high_set}s, #{high_card} high", [4,face_value(high_set),face_value(low_set),face_value(high_card)] if oak3
  return "2 pairs, #{high_set}s high, #{low_set}s low", [3,face_value(high_set),face_value(low_set),face_value(high_card)] if oak2x2
  return "pair of #{high_set}s, high card #{high_card}", [2,face_value(high_set),face_value(low_set),face_value(high_card)] if oak2
  return "#{high_card} high", [1,face_value(high_set),face_value(low_set),face_value(high_card)]
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

#p p1_hands[999]
#p p2_hands[999]

p1_wins = 0
p2_wins = 0

(0...p1_hands.size).each do |hand|
  p1_flush = p2_flush = false
  p1_straight = p2_straight = false
  p1_royal = p2_royal = false
  p1_4oak = p2_4oak = false
  p1_3oak = p2_3oak = false
  p1_2x2oak = p2_2x2oak = false
  p1_2oak = p2_2oak = false
  p1_fh = p2_fh = false
  p1_sf = p2_sf = false
  p1_rf = p2_rf = false
  p1_high_set = p2_high_set = 0
  p1_low_set = p2_low_set = 0
  p1_high_card = p2_high_card = 0

  p1_cards = p1_hands[hand]
  p2_cards = p2_hands[hand]

  p1_vals = []
  p1_cards.each do |card|
    p1_vals << card[0]
  end
  p2_vals = []
  p2_cards.each do |card|
    p2_vals << card[0]
  end

  p1_flush = true if flush?(p1_cards)
  p2_flush = true if flush?(p2_cards)

  p1_straight = true if straight?(p1_vals)
  p2_straight = true if straight?(p2_vals)

  p1_royal = true if royal?(p1_vals)
  p2_royal = true if royal?(p2_vals)

  p1_2oak, p1_3oak, p1_4oak, p1_2x2oak, p1_fh, p1_high_card, p1_high_set, p1_low_set = check_hand(p1_vals)
  p2_2oak, p2_3oak, p2_4oak, p2_2x2oak, p2_fh, p2_high_card, p2_high_set, p2_low_set = check_hand(p2_vals)

  p1_hand_id, p1_stats = identify_hand(p1_flush, p1_straight, p1_royal, p1_4oak, p1_3oak, p1_2x2oak, p1_2oak, p1_fh, p1_high_card, p1_high_set, p1_low_set)
  p2_hand_id, p2_stats = identify_hand(p2_flush, p2_straight, p2_royal, p2_4oak, p2_3oak, p2_2x2oak, p2_2oak, p2_fh, p2_high_card, p2_high_set, p2_low_set)
  #puts "Player 1:\t[hand #{hand+1}]\t#{p1_hand_id}"
  #puts "Player 2:\t[hand #{hand+1}]\t#{p2_hand_id}"
  if p1_stats[0] > p2_stats[0]
    p1_wins += 1
    #puts "Player 1 wins"
  elsif p1_stats[0] == p2_stats[0]
    if p1_stats[1] > p2_stats[1]
      p1_wins += 1
      #puts "Player 1 wins"
    elsif p1_stats[1] == p2_stats[1]
      if p1_stats[2] > p2_stats[2]
        p1_wins += 1
        #puts "Player 1 wins"
      elsif p1_stats[2] == p2_stats[2]
        if p1_stats[3] > p2_stats[3]
          p1_wins += 1
          #puts "Player 1 wins"
        elsif p1_stats[3] == p2_stats[3]
          #puts "It's a tie"
        else
          p2_wins += 1
          #puts "Player 2 wins"
        end
      else
        p2_wins += 1
        #puts "Player 2 wins"
      end
    else
      p2_wins += 1
      #puts "Player 2 wins"
    end
  else
    p2_wins += 1
    #puts "Player 2 wins"
  end

  #TODO deal with edge case tie breakers as they crop up

end

puts "Player 1 won #{p1_wins} games"
puts "Player 2 won #{p2_wins} games"
puts "#{Time.now-time} seconds elapsed"
