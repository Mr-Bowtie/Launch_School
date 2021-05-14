require 'pry'
CARD_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10, "Ace" => 11 }

def prompt(input)
  puts "==> #{input}"
end

def initialize_deck
  new_deck = []
  4.times do
    (2..10).each do |i|
      new_deck << i.to_s
    end
    new_deck << "Jack" << "Queen" << "King" << "Ace"
  end
  new_deck
end

def display_hands(player, dealer, state = nil)
  if state == "final"
    puts "**************"
    prompt "Dealer has: #{dealer.join(", ")}, totaling #{eval_hand(dealer)}"
    prompt "You have: #{player.join(", ")}, totaling #{eval_hand(player)}"
    puts "**************"
  else
    prompt "Dealer has: #{dealer[0]} and unknown card"
    prompt "You have: #{player.join(", ")}"
  end
end

def deal!(player, deck)
  player << deck.delete_at(deck.index(deck.sample))
end

def busted?(hand_total)
  hand_total > 21
end

def play_again?
  loop do
    prompt "would you like to play another hand? (y/n)"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes"
      return true
    elsif answer == "n" || answer == "no"
      return false
    else
      prompt "I didnt quite catch that."
    end
  end
end

# TODO refactor
def eval_hand(hand)
  number_of_aces = hand.count("Ace")
  sum = hand.map {|card| CARD_VALUES[card]}.sum
  number_of_aces.times {sum -= 10 if (sum > 21)}
  sum
end


def calc_result(player, dealer)
  if player > 21
    :player_busted
  elsif dealer > 21 
    :dealer_busted
  elsif player > dealer 
    :player
  elsif dealer > player 
    :dealer
  end 
end

def display_result(player, dealer)
  case calc_result(player, dealer)
  when :player_busted
    prompt "You busted, dealer wins"
  when :dealer_busted
    prompt "Dealer busted, You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins"
  end 
end

# TODO add in friendly messages and clear directions

loop do
  deck = []
  player_hand = []
  dealer_hand = []
  system "clear"
  deck = initialize_deck
  2.times do
    deal!(player_hand, deck)
    deal!(dealer_hand, deck)
  end
 player_total = eval_hand(player_hand)
 dealer_total = eval_hand(dealer_hand) 
  # TODO add delay to the steps to display the result
  # ? dealing "loading" animation?
  
  # * Players turn
  # TODO make array of acceptable answers
  loop do
    display_hands(player_hand, dealer_hand)
    puts ""
    prompt "(H)it or (S)tay?"
    action = gets.chomp.downcase
    if action == "hit" || action == "h"
      system "clear"
      deal!(player_hand, deck)
      player_total = eval_hand(player_hand)
    elsif action != "hit" && action != "stay"
      prompt "Invalid input: Either Hit or Stay"
      next
    end
    # binding.pry
    break if (action == "stay" || action == "s") || busted?(player_total)
  end
  
  if busted?(player_total)
    prompt "You busted, Dealer wins"
    break unless play_again?()
    next
  end
  
  # * Dealers turn
  
  loop do
    break if dealer_total >= 17
    # binding.pry
    deal!(dealer_hand, deck)
    dealer_total = eval_hand(dealer_hand)
  end

  if busted?(dealer_total)
    prompt "Dealer busted, You win!"
    break unless play_again?()
    next
  end
  system "clear"
  display_hands(player_hand, dealer_hand, "final")
  display_result(player_total, dealer_total)

  break unless play_again?()
end

prompt "Thanks for playing 21, Goodbye!"

# ? maybe add a betting/scoring system tracked from round to round
