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

def display_hands(player, dealer, state = nil)
  if state == "final"
    prompt "Dealer had: #{dealer.join(", ")}"
    prompt "You had: #{player.join(", ")}"
  else
    prompt "Dealer has: #{dealer[0]} and unknown card"
    prompt "You have: #{player.join(", ")}"
  end
end

def deal(player, deck)
  player << deck.delete_at(deck.index(deck.sample))
end

def busted?(hand)
  eval_hand(hand) > 21
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

loop do
  system "clear"
  deck = initialize_deck
  2.times do
    deal(player_hand, deck)
    deal(dealer_hand, deck)
  end

  #TODO add delay to the steps to display the result
  #* Players turn

  loop do
    display_hands(player_hand, dealer_hand)
    puts ""
    prompt "Hit or Stay?"
    action = gets.chomp.downcase
    if action == "hit"
      system "clear"
      deal(player_hand, deck)
    elsif action != "hit" && action != "stay"
      prompt "Invalid input: Either Hit or Stay"
      next
    end
    break if (action == "stay") || busted?(player_hand)
  end

  if busted?(player_hand)
    prompt "You busted, Dealer wins"
    break
  end

  #* Dealers turn

  loop do
    break if eval_hand(dealer_hand) >= 17
    deal(dealer_hand, deck)
  end

  if busted?(dealer_hand)
    prompt "Dealer busted, You win!"
    break
  end
  system "clear"
  display_hands(player_hand, dealer_hand, "final")
  prompt "Dealer: #{eval_hand(dealer_hand)}"
  prompt "You: #{eval_hand(player_hand)}"
  break
end
