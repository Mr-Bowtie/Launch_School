require "pry"
VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
VALID_ABBREVIATION = ["r", "p", "s", "l", "sp"]
PLAYS = { "rock" => ["scissors", "lizard"], "paper" => ["rock", "spock"], "scissors" => ["paper", "lizard"], "spock" => ["scissors", "rock"], "lizard" => ["spock", "paper"] }

def prompt(message)
  puts "=> #{message}"
end

def valid_choice?(input)
  VALID_CHOICES.include?(input) || VALID_ABBREVIATION.include?(input)
end

def convert_user_choice(input)
  if input.length <= 2
    case input
    when "r"
      input = "rock"
    when "p"
      input = "paper"
    when "s"
      input = "scissors"
    when "l"
      input = "lizard"
    when "sp"
      input = "spock"
    end
  end
  input
end

def win?(first, second)
  if PLAYS[first].include?(second)
    return true
  end
end

def lose?(first, second)
  if PLAYS[second].include?(first)
    return true
  end
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

loop do
  choice = ""
  loop do
    prompt("choose one: #{VALID_CHOICES.join(", ")}")
    prompt("or: #{VALID_ABBREVIATION.join(", ")}")
    choice = gets.chomp

    break if valid_choice?(choice)
    prompt("That's not a valid choice.")
  end
  choice = convert_user_choice(choice)

  computer_choice = VALID_CHOICES.sample

  # binding.pry
  display_result(choice, computer_choice)

  puts "You chose #{choice}: computer chose #{computer_choice}"

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thank you for playing! Good bye"
