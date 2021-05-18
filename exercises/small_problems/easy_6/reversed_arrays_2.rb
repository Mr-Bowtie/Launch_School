# INPUT: Array
# OUTPUT: new array with the elements of the original is reverse order
# ALGORITHM:
#   - create an empty Array
#   - iterate over passed in array
#     - shift each element to the front of the new array
#   return new array

def reverse(array)
  new_array = []
  array.each { |el| new_array.unshift(el) }
  new_array
end

puts reverse([1, 2, 3, 4]) == [4, 3, 2, 1]
puts reverse(%w[a b e d c]) == %w[c d e b a]
puts reverse(['abc']) == ['abc']
puts reverse([]) == []
