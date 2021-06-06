# INPUT: two integers 
#   - first being the size of the output array 
#   - the second being the starting number of the output
# OUTPUT: an array of integers 
#   - the array is the length of the first input integer 
#   - each element is a multiple of the second input integer 
# RULES: 
#   - the count will always be 0 or greater 
#   - on a count value of 0, return an empty array 
#   - the starting number can be of any value 
# ALGORITHM: 
#   - if the count is 0, return an empty array 
#   - create an empty array 
#   - loop a number of times equal to the count and starting on the starting number
#     - push the starting number * the iterator number to the new array 
#   return the new array 

def sequence(count, start)
  return [] if count == 0 
  sequence_array = []
  iterator = 1
  count.times do
     sequence_array << start * iterator 
     iterator += 1 
  end 
  sequence_array
end 

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []