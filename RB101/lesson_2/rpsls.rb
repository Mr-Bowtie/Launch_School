VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_ABBREVIATION = ['r', 'p', 'sc', 'l', 'sp']
WINNING_CONDITION = {
  "rock" => ["lizard", "scissors"],
  "paper" => ["spock", "rock"],
  "scissors" => ["lizard", "paper"],
  "lizard" => ["spock", "paper"],
  "spock" => ["scissors", "rock"]
}

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

def display_score(player, computer)
  prompt "Player: #{player} Computer: #{computer}"
end

def win?(first, second)
  WINNING_CONDITION[first].include?(second)
end

def result(player, computer)
  if win?(player, computer)
    1
  elsif win?(computer, player)
    2
  end
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
  if player == 5
    prompt "You won the match!"
  elsif computer == 5
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

prompt "Welcome to RPSLS. First to 5 wins! "
loop do
  choice = ''
  player_score = 0
  comp_score = 0
  until player_score > 4 || comp_score > 4
    loop do
      prompt "Choose one: #{VALID_CHOICES.join(', ')}"
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_ABBREVIATION.include?(choice)
        convert_abrv(choice)
        break
      else
        prompt "Not a valid choice. You may abbreviate to r, p, sc, l, or sp"
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt "you chose: #{choice}, The computer chose: #{computer_choice}"

    player_score += 1 if result(choice, computer_choice) == 1
    comp_score += 1 if result(choice, computer_choice) == 2

    display_result(choice, computer_choice)
    display_score(player_score, comp_score)
  end

  display_grand(player_score, comp_score)
  break unless redo?
end

prompt "Thank you for playing."
