# GAME LOOP:
#   1. initialize deck
#   2. deal cards
#   3. players turn
#     - hit until bust or stay
#     if bust, dealer wins
#   4 dealers turn
#     - hit until total is at least 17
#     if bust, player wins
#   5. compare cards
#     - highest value wins
#   6 play again?
#     - yes => back to 1
#     - no => Goodbye!

# DECK:
# - 52 cards
# - 4 each [1-10], jack, queen, king, ace
require "pry"
require "pry-byebug"
CARD_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10 }

def prompt(input)
  puts "==> #{input}"
end

def initialize_deck
  new_deck = []
  4.times do
    for i in 2..10
      new_deck << i.to_s
    end
    new_deck << "Jack" << "Queen" << "King" << "Ace"
  end
  new_deck
end

def display_hands(player, dealer)
  puts "Dealer has: #{dealer[0]} and unknown card"
  puts "You have: #{player[0]} and #{player[1]}"
end

def deal(player, dealer = nil, deck)
  if dealer
    dealer << deck.delete_at(deck.index(deck.sample))
  end
  player << deck.delete_at(deck.index(deck.sample))
end

#TODO: break this into two other methods - hand_values() and calc_hand()
def eval_hand(hand)
  values = hand.map do |card|
    if card == "Ace"
      card
    else
      CARD_VALUES[card]
    end
  end
  values.reduce(0) do |sum, value|
    if value == "Ace"
      if (sum + 11) > 21
        sum + 1
      else
        sum + 11
      end
    else
      sum + value
    end
  end
end

deck = []
player_hand = []
dealer_hand = []

deck = initialize_deck
2.times { deal(player_hand, dealer_hand, deck) }
display_hands(player_hand, dealer_hand)
puts ""

#TODO add delay to the steps to display the result
#TODO make the input non case sensitive

#* Players turn
loop do
  prompt "Hit or Stay?"
  action = gets.chomp
  case action
  when "Hit"
    deal(player_hand, deck)
  when "Stay"
    break
  else
    prompt "Invalid input: Either Hit or Stay"
    next
  end
  display_hands(player_hand, dealer_hand)
  hand_total = eval_hand(player_hand)
  binding.pry
  # if hand_total > 21
  #   prompt "You Bust"
  #   break
  # end
end
