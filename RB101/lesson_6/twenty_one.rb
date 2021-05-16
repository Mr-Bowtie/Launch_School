require "pry"
CARD_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10, "Ace" => 11 }
TARGET_WINS = 5

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

def display_hands(hands, totals, state = nil)
  if state == "final"
    puts "**********************************"
    prompt "Dealer has: #{hands[:dealer].join(", ")} ==> #{eval_hand!(hands, :dealer, totals)}"
    prompt "You have: #{hands[:player].join(", ")} ==> #{eval_hand!(hands, :player, totals)}"
    puts "**********************************"
  else
    prompt "Dealer has: #{hands[:dealer][0]} and unknown card"
    prompt "You have: #{hands[:player].join(", ")}"
  end
end

def deal!(deck, hands, player)
  hands[player] << deck.shift
end

def eval_hand!(hands, player, totals)
  number_of_aces = hands[player].count("Ace")
  sum = hands[player].map { |card| CARD_VALUES[card] }.sum
  number_of_aces.times { sum -= 10 if (sum > 21) }
  totals[player] = sum
end

def busted?(totals, player)
  totals[player] > 21
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

def calc_result(totals)
  if busted?(totals, :player)
    :player_busted
  elsif busted?(totals, :dealer)
    :dealer_busted
  elsif totals[:player] > totals[:dealer]
    :player
  elsif totals[:dealer] > totals[:player]
    :dealer
  end
end

def display_result(totals)
  case calc_result(totals)
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

def display_grand_output(hands, totals)
  system "clear"
  display_hands(hands, totals, "final")
  display_result(totals)
end

def update_hands_won(totals, hands_won)
  case calc_result(totals)
  when :dealer_busted, :player
    hands_won[:player] += 1
  when :player_busted, :dealer
    hands_won[:dealer] += 1
  end
end

def grand_winner(hands_won)
  hands_won[:player] == TARGET_WINS ? :player : dealer
end

def target_reached(hands_won)
  hands_won.values.include?(5)
end

# TODO add in friendly messages and clear directions

loop do
  hands_won = { player: 0, dealer: 0 }
  loop do
    hands, totals = initialize_players
    deck = initialize_deck
    system "clear"
    2.times do
      deal!(deck, hands, :player)
      deal!(deck, hands, :dealer)
    end
    eval_hand!(hands, :player, totals)
    eval_hand!(hands, :dealer, totals)

    # * Players turn

    loop do
      display_hands(hands, totals)
      puts ""
      prompt "(H)it or (S)tay?"
      action = gets.chomp.downcase
      if %(hit, h).include?(action)
        system "clear"
        deal!(deck, hands, :player)
        eval_hand!(hands, :player, totals)
      elsif !%(hit, stay, h, s).include?(action)
        prompt "Invalid input: Either Hit or Stay"
        next
      end
      break if %(stay, s).include?(action) || busted?(totals, :player)
    end

    if busted?(totals, :player)
      display_grand_output(hands, totals)
      next
    end

    # * Dealers turn

    loop do
      break if totals[:dealer] >= 17
      deal!(deck, hands, :dealer)
      eval_hand!(hands, :dealer, totals)
    end

    if busted?(totals, :dealer)
      display_grand_output(hands, totals)
      next
    end
    #TODO make grand output for ultimate winner, make round output for round winners
    display_grand_output(hands, totals)
    update_hands_won(totals, hands_won)
    #TODO add enter break for next round
    sleep(2)
    break if target_reached(hands_won)
  end
  #TODO finish round scoring implementation

  break unless play_again?()
end
prompt "Thanks for playing 21, Goodbye!"
# ? maybe add a betting/scoring system tracked from round to round
