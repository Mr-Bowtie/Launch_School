# INPUT: a range given as two integers, the start and end
# OUTPUT: print out all numbers in range
# RULES:
#   1. replace any number divisible by 3 with "Fizz"
#   2. replace any number divisible by 5 with "Buzz"
#   3. replace any number divisible by both 3 & 5 with "FizzBuzz"
# ALGORITHM:
#   - iterate over range
#     - if num divisible by 15 print "fizzbuzz"
#     - if num divisible by 5 print "buzz"
#     - if num divisible by 3 print 'fizz'
#     - else print number

def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    if num % 15 == 0
      print "FizzBuzz "
    elsif num % 5 == 0
      print "Buzz "
    elsif num % 3 == 0
      print "Fizz "
    else
      print "#{num.to_i} "
    end
  end
end

fizzbuzz(1, 15)
