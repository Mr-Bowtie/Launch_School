# INPUT: an array of any length
# OUTPUT: a new array with the first element rotated to the end of the array 
# RULES:  the original array must not be modified
#   - you cannot use Array#rotate
# ALGORITHM: 
#   - duplicate the input array 
#   - remove the first element 
#   - append it to the duplicate 
#   - return the duplicate 

def rotate_array(array)
  clone = array.dup
  first_el = clone.shift
  clone << first_el
end 

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true