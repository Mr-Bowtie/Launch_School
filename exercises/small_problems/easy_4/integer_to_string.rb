DIGITS = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}

def integer_to_string(num)
  num_array = num.digits.reverse.map { |digit| DIGITS[digit] }.join
end

# puts integer_to_string(0)
# puts integer_to_string(100)
# puts integer_to_string(-421989)

#hash was unecessary as the digits written with 0 first correspond to their index in an array.
# as was the map conversion of the reversed digits array. Array#join converts each element to a string.
# but i suppose that's sort of cheating by using a method to convert data types without character evaluation.

# def signed_integer_to_string(int)
#   case int <=> 0
#   when -1 then "-#{integer_to_string(-int)}"
#   when 1 then "+#{integer_to_string(int)}"
#   else integer_to_string(int)

#   end
# end

#needed the solution on that one. I was on the right track with the case statement, but couldnt get it to resolve

# further exploration:

def signed_integer_to_string(int)
  string = integer_to_string(int.negative? ? -int : int)
  case int <=> 0
  when 0
    string
  when -1
    string.prepend('-')
  when 1
    string.prepend('+')
  end
end

puts signed_integer_to_string(0)
puts signed_integer_to_string(12)
puts signed_integer_to_string(-12)
