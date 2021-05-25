# INPUT: an array of numbers
# OUTPUT: an integer, the sum of the sums of each number in the array being added to the first in sequence
# RULES:
#   - the input array will always contain at least one number
# ALGORITHM:
#   - create sum variable
#   - create current numbers array
#   - iterate over input array
#     - add current value to current numbers array
#     - reassign sum to sum + current_numbers
#   - return sum

def sum_of_sums(int_arr)
  sum = 0
  current_numbers = []
  int_arr.each { |int|
    current_numbers << int
    sum += current_numbers.sum
  }
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
