CARD_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
                "7" => 7, "8" => 8, "9" => 9, "10" => 10,
                "Jack" => 10, "Queen" => 10, "King" => 10, "Ace" => 11 }
TARGET_WINS = 5
MAX_HAND_VALUE = 21
MAX_DEALER_HIT = 17

def prompt(input)
  puts "==|: #{input}"
end

def initialize_deck
  new_deck = []
  4.times do
    (2..10).each do |i|
      new_deck << i.to_s
    end
    new_deck << "Jack" << "Queen" << "King" << "Ace"
  end
  new_deck.shuffle
end

def initialize_players
  return { player: [], dealer: [] }, { player: 0, dealer: 0 }
end

def play_round(deck, hands, hand_sums)
  players_turn(deck, hands, hand_sums)
  unless busted?(hand_sums, :player)
    dealers_turn(deck, hands, hand_sums)
  end
end

def hit(deck, hands, hand_sums, player)
  deal!(deck, hands, player)
  eval_hand!(hands, player, hand_sums)
end

def players_turn(deck, hands, hand_sums)
  loop do
    display_hands(hands, hand_sums)
    prompt "(H)it or (S)tay?"
    action = gets.chomp.downcase
    case action
    when "h", "hit"
      system "clear"
      hit(deck, hands, hand_sums, :player)
    when "s", "stay"
      break
    else
      prompt "Invalid input: Either Hit or Stay"
    end
    break if busted?(hand_sums, :player)
  end
end

def dealers_turn(deck, hands, hand_sums)
  loop do
    break if hand_sums[:dealer] >= MAX_DEALER_HIT
    hit(deck, hands, hand_sums, :dealer)
  end
end

def display_hands(hands, hand_sums, state = nil)
  if state == "result"
    puts "**********************************"
    prompt "Dealer has: #{hands[:dealer].join(", ")} ==> #{eval_hand!(hands, :dealer, hand_sums)}"
    prompt "You have: #{hands[:player].join(", ")} ==> #{eval_hand!(hands, :player, hand_sums)}"
    puts "**********************************"
  else
    prompt "Dealer has: #{hands[:dealer][0]} and unknown card"
    prompt "You have: #{hands[:player].join(", ")}"
  end
end

def deal!(deck, hands, player)
  hands[player] << deck.shift
end

def eval_hand!(hands, player, hand_sums)
  number_of_aces = hands[player].count("Ace")
  sum = hands[player].map { |card| CARD_VALUES[card] }.sum
  number_of_aces.times { sum -= 10 if sum > 21 }
  hand_sums[player] = sum
end

def busted?(hand_sums, player)
  hand_sums[player] > 21
end

def play_again?
  loop do
    prompt "would you like to play another hand? (y/n)"
    answer = gets.chomp.downcase
    case answer
    when "yes", "y"
      return true
    when "no", "n"
      return false
    else
      prompt "It's really a yes or no question, try again"
    end
  end
end

def calc_result(hand_sums)
  if busted?(hand_sums, :player)
    :player_busted
  elsif busted?(hand_sums, :dealer)
    :dealer_busted
  elsif hand_sums[:player] > hand_sums[:dealer]
    :player
  elsif hand_sums[:dealer] > hand_sums[:player]
    :dealer
  end
end

def display_result(hand_sums)
  case calc_result(hand_sums)
  when :player_busted
    prompt "You busted, dealer wins"
  when :dealer_busted
    prompt "Dealer busted, You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins"
  else
    prompt "Round ends in tie"
  end
end

def display_round(hands, hand_sums, scores)
  system "clear"
  display_hands(hands, hand_sums, "result")
  display_result(hand_sums)
  display_score(scores)
  return if match_winner?(scores)
  puts "press enter to play next hand"
  gets.chomp
end

def update_hands_won(hand_sums, hands_won)
  case calc_result(hand_sums)
  when :dealer_busted, :player
    hands_won[:player] += 1
  when :player_busted, :dealer
    hands_won[:dealer] += 1
  end
end

def setup_hands(deck, hands, hand_sums)
  2.times do
    deal!(deck, hands, :player)
    deal!(deck, hands, :dealer)
  end
  eval_hand!(hands, :player, hand_sums)
  eval_hand!(hands, :dealer, hand_sums)
end

def display_score(scores)
  puts "--------------------------------"
  puts "SCORE: Player => #{scores[:player]}, Dealer => #{scores[:dealer]}"
  puts "--------------------------------"
end

def display_match(scores)
  puts ""
  puts "~*~*~*~*~*~*~*~*~"
  puts "#{calc_winner(scores)} wins the match!"
  puts "~*~*~*~*~*~*~*~*~"
end

def match_winner?(scores)
  scores.values.include?(TARGET_WINS)
end

def calc_winner(scores)
  scores[:player] == TARGET_WINS ? "Player" : "Dealer"
end

def display_welcome
  system "clear"
  prompt "Welcome to 21"
  prompt "The goal is to get your hand as close to 21 without going over"
  prompt "The higher score wins the round"
  prompt "First to 5 rounds wins the match"
  puts ""
  prompt "press enter to begin"
  gets
end

loop do
  hands_won = { player: 0, dealer: 0 }
  display_welcome()
  until match_winner?(hands_won)
    deck = initialize_deck
    hands, hand_sums = initialize_players
    system "clear"
    setup_hands(deck, hands, hand_sums)
    play_round(deck, hands, hand_sums)
    update_hands_won(hand_sums, hands_won)
    display_round(hands, hand_sums, hands_won)
  end
  display_match(hands_won)
  break unless play_again?()
end
prompt "Thanks for playing 21, Goodbye!"
