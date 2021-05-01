# INPUT:  two arrays
# OUTPUT: a new array containing all unique values from the two given arrays
# ALGORITHM:
#   - concat two arrays
#   - return unique array

def merge(arr1, arr2)
  arr1.concat(arr2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
