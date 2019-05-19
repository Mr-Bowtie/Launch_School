VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_ABBREVIATION = ['r', 'p', 'sc', 'l', 'sp']
WINNING_CONDITION = {
  "rock" => ["lizard", "scissors"],
  "paper" => ["spock", "rock"],
  "scissors" => ["lizard", "paper"],
  "lizard" => ["spock", "paper"],
  "spock" => ["scissors", "rock"]
}
MATCH_WIN = 5

def prompt(message)
  puts "-> #{message}"
end

def convert_abrv(input)
  if input == "r"
    input << "ock"
  elsif input == "p"
    input << "aper"
  elsif input == "sc"
    input << "issors"
  elsif input == "l"
    input << "izard"
  elsif input == "sp"
    input << "ock"
  end
end

def retrieve_user_choice
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    pchoice = gets.chomp.downcase
    if VALID_CHOICES.include?(pchoice)
      return pchoice
    elsif VALID_ABBREVIATION.include?(pchoice)
      convert_abrv(pchoice)
      return pchoice
    else
      prompt "Not a valid choice. You may abbreviate to r, p, sc, l, or sp"
    end
  end
end

def display_score(player, computer)
  prompt "Player: #{player} Computer: #{computer}"
end

def display_welcome
  prompt "Welcome to RPSLS. First to 5 wins! "
end

def display_choices(player, computer)
  prompt "you chose: #{player}, The computer chose: #{computer}"
end

def display_goodbye
  prompt "Thank you for playing!"
end

def win?(first, second)
  WINNING_CONDITION[first].include?(second)
end

def player_won?(player, computer)
  true if win?(player, computer)
end

def computer_won?(player, computer)
  true if win?(computer, player)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt "You win!"
  elsif win?(computer, player)
    prompt "Computer wins!"
  else
    prompt "It's a tie!"
  end
end

def display_grand(player, computer)
  if player == MATCH_WIN
    prompt "You won the match!"
  elsif computer == MATCH_WIN
    prompt "The computer won the match."
  end
end

def redo?
  prompt 'Would you like to play again?'
  loop do
    answer = gets.chomp.downcase
    if valid_redo_answer?(answer)
      return answer == 'y' || answer == 'yes'
    end
    prompt 'Invalid input: yes, no, y, n only '
  end
end

def valid_redo_answer?(input)
  %(y n yes no).include?(input)
end

def match_ended?(player, computer)
  player == MATCH_WIN || computer == MATCH_WIN
end

prompt "Welcome to RPSLS. First to 5 wins! "
loop do
  player_score = 0
  comp_score = 0
  until match_ended?(player_score, comp_score)
    choice = retrieve_user_choice()
    system('clear') || system('cls')
    computer_choice = VALID_CHOICES.sample

    display_choices(choice, computer_choice)
    player_score += 1 if player_won?(choice, computer_choice)
    comp_score += 1 if computer_won?(choice, computer_choice)
    display_result(choice, computer_choice)
    display_score(player_score, comp_score)

  end

  display_grand(player_score, comp_score)
  break unless redo?
end

display_goodbye()
