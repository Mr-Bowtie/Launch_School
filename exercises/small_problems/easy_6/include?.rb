# INPUT: an array and a search value
# OUTPUT: boolean representing whether the search value matched any value in the array
# RULES:
#  -  array can be any size
#  - only return a boolean
#  - cannot use Array#include?
#  - empty arrays always return false, no value can be searched
#  - arrays can contain any type of objects
#  for
#  ALGORITHM:
#  - iterate over the array
#    - compare search value to element
#    - return true if two elements are equal

def include?(arr, search_val)
  arr.each do |el|
    if el == search_val
      return true
    else
    end
  end
  false
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
