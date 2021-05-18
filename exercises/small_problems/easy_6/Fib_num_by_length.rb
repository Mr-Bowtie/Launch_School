# INPUT: an integer which represents a number of digits
# OUPUT: an integer representing the first index in the Fibonacci sequence whose value has the number of digits specified in the input
# RULES:
#   - the input will always be greater than 2
#   - I will need to generate fibonacci numbers until the number matches my requirements
#   - fibonacci sequence starts the 1,1 then each proceeding number is the sum of the previous two
#   - the first number in the fibonacci has index 1
# ALGORITHM:
#   - generate a fibonocci sequence
#   - with each number, check to see if it meets the required digit length
#   - return index if yes

def find_fibonacci_index_by_length(digits)
  fibonacci = [1, 1]
  a = fibonacci[0]
  b = fibonacci[1]
  while fibonacci.last.to_s.length < digits
    b = b + a
    a = b - a
    fibonacci << b
  end
  fibonacci.index(b) + 1
end

puts find_fibonacci_index_by_length(2) == 7 # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12 # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10_000) == 47_847
