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

deck = []
player_hand = []
dealer_hand = []

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

def deal(player, dealer, deck)
  2.times do
    dealer << deck.delete_at(deck.index(deck.sample))
    player << deck.delete_at(deck.index(deck.sample))
  end
  display_hands(player, dealer)
end

deck = initialize_deck
deal(player_hand, dealer_hand, deck)