require "pry"
REDO_ANSWERS = ["yes", "y"]
VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
VALID_ABBREVIATION = ["r", "p", "s", "l", "sp"]
PLAYS = { "rock" => ["scissors", "lizard"],
          "paper" => ["rock", "spock"],
          "scissors" => ["paper", "lizard"],
          "spock" => ["scissors", "rock"],
          "lizard" => ["spock", "paper"] }
WINNING_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def display_choices
  prompt("choose one: #{VALID_CHOICES.join(", ")}")
  prompt("or: #{VALID_ABBREVIATION.join(", ")}")
end

def get_user_input
  loop do
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      return choice
    elsif VALID_ABBREVIATION.include?(choice)
      return convert_user_choice(choice)
    else
      prompt "Invalid input: refer to choices above"
    end
  end
end

def valid_choice?(input)
  VALID_CHOICES.include?(input) || VALID_ABBREVIATION.include?(input)
end

def convert_user_choice(input)
  case input
  when "r"
    input << "ock"
  when "p"
    input << "aper"
  when "s"
    input << "cissors"
  when "l"
    input << "izard"
  when "sp"
    input << "pock"
  end
end

def win?(first, second)
  PLAYS[first].include?(second)
end

def lose?(first, second)
  PLAYS[second].include?(first)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt "You Won!"
  elsif lose?(player, computer)
    prompt "Computer won!"
  else
    prompt "Tie!"
  end
end

def display_play(player, computer)
  prompt "You chose #{player} : Computer chose #{computer}"
end

def display_score(player, comp)
  prompt "Player #{player} : Computer #{comp} \n"
end

def redo?
  redo_message()
  REDO_ANSWERS.include?(gets.chomp)
end

def exit_message
  prompt "Thank you for playing. Goodbye!"
end

def display_match_winner(player_score)
  if player_score == 5
    prompt "You have won the match"
  else
    prompt "The Computer has won the match"
  end
end

def redo_message
  prompt "Would you like to play again?"
end

loop do
  player_score = 0
  comp_score = 0
  until player_score == WINNING_SCORE || comp_score == WINNING_SCORE
    display_choices()
    choice = get_user_input()
    system("clear") || system("cls")
    computer_choice = VALID_CHOICES.sample

    player_score += 1 if win?(choice, computer_choice)
    comp_score += 1 if lose?(choice, computer_choice)

    display_result(choice, computer_choice)
    display_play(choice, computer_choice)
    display_score(player_score, comp_score)
  end
  display_match_winner(player_score)
  break unless redo?()
end

prompt "Thank you for playing! Good bye"
