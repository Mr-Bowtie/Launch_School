# INPUT: two arrays
# OUTPUT: A new array combining the elements of the two input arrays, the elements alternating tfrom each array
# RULES:
#   - both arrays will be of the same length
#   - the arrays will never be empty
# ALGORITHM:
#   - create new array
#   - repeat array.size times
#     - push element at index (iterator number) from array_1 to new Array
#     - push element at index (iterator number) from array_2 to new Array
#   - return new array

#* first run
# def interleave(arr1, arr2)
#   new_array = []
#   array_size = arr1.length
#   array_size.times { |i| new_array << arr1[i] << arr2[i] }
#   new_array
# end

#* further exploration
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], %w[a b c]) == [1, 'a', 2, 'b', 3, 'c']
