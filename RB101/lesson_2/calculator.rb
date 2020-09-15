puts "Welcome to calculator! Enter the first number"
number1 = gets.chomp.to_i
puts "enter your second number"
number2 = gets.chomp.to_i
puts """What operation would you like to perform?
        1 - add
        2 - subtract
        3 - multiply
        4 - divide
"""
operation = gets.chomp

case operation
when "1"
  puts "Result: #{number1 + number2}"
when "2"
  puts "Result: #{number1 - number2}"
when "3"
  puts "Result: #{number1 * number2}"
when "4"
  puts "Result: #{number1.to_f / number2.to_f}"
else
  puts "incorrect operation input"
end
