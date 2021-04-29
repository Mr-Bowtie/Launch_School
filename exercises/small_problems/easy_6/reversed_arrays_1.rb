# INPUT: an array
# OUTPUT: the same array with elements reversed in place
# RULES:
#  - single element arrays and empty arrays should just return themselves
#  - cannot use Array#reverse or Array#reverse!
#  - method must mutate the original array not create a new one
# ALGORITHM:
#   - iterate over the array equal to length - 1
#     -  remove the first element, store in a variable
#     -  push variable value to back of array
#   - return array

def reversed(arr)
  (arr.length - 1).times do |e|
    carrier = arr.delete_at(e + 1)
    arr.unshift(carrier)
  end
  arr
end

array = [1, 2, 3, 4]
p array.object_id
p reversed(array)
p array.object_id
