# find the multiples of 3 & 5 between 1 and a given number(including the number)
# return the sum of all of the multiples found

# input: an integer > 1
# output: sum of all multiples of 3 and 5 between and and the given number

# Includes the given number in the list of multiples summed if it is a multiple of
# 3 or 5

# store multiples in array

# iterate through range, if current number is multiple of 3 || 5 << multiple_array
# reduce sum multiple_array

def multisum(range_end)
  multiples = []
  for i in 1..range_end do
    multiples << i if i % 3 == 0 || i % 5 ==0
  end
  multiples.reduce(:+)
end 

puts multisum(10)
puts multisum(3)
puts multisum(5)
puts multisum(1000)
