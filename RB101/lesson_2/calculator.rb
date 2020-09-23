def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  else
    'Dividing'
  end
end

prompt("Welcome to calculator! Enter your name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Invalid name"
  else
    break
  end
end

prompt "Hi #{name}"

loop do
  number1 = ""
  until valid_number?(number1)
    prompt("Enter the first number")
    number1 = gets.chomp
    prompt("invalid input") unless valid_number?(number1)
  end
  number2 = ""
  until valid_number?(number2)
    prompt("enter your second number")
    number2 = gets.chomp
    prompt("invalid input") unless valid_number?(number2)
  end

  operation_message = <<-MSG
    What operation would you like to perform?
    1 - add
    2 - subtract
    3 - multiply
    4 - divide
    MSG

  prompt(operation_message)

  operation = ""
  loop do
    operation = gets.chomp
    if %(1 2 3 4).include?(operation)
      break
    else
      prompt "please choose 1, 2, 3, or 4"
    end
  end

  case operation
  when "1"
    result = number1.to_i + number2.to_i
  when "2"
    result = number1.to_i - number2.to_i
  when "3"
    result = number1.to_i * number2.to_i
  when "4"
    result = number1.to_f / number2.to_f
  else
    puts "incorrect operation input"
  end

  prompt "#{operation_to_message(operation)} the two numbers"

  prompt("The result is: #{result}")

  prompt("Calculate again? (Y/n")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "goodbye, #{name}!"
