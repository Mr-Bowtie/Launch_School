VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def lose?(first, second)
  (second == "rock" && first == "scissors") ||
    (second == "paper" && first == "rock") ||
    (second == "scissors" && first == "paper")
end

def display_result(player, computer)
  if win?(player, computer)
    prompt "You Won!"
  elsif lose?(computer, player)
    prompt "Computer won!"
  else
    prompt "Tie!"
  end
end

loop do
  choice = ""
  loop do
    prompt("choose one: #{VALID_CHOICES.join(", ")}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_result(choice, computer_choice)

  puts "You chose #{choice}: computer chose #{computer_choice}"

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thank you for playing! Good bye"
