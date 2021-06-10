# INPUT: 2 integers 
#   - 1 being the number to work on 
#   - 2 being the number of digits from the end to rotate
# OUTPUT: a new integer
#   - with the last n digits rotated 
#   - rotating 1 digits returns the original number 
# RULES:
#   - n will always be a positive integer
# ALGORITHM: 
#   - turn number into a string 
#   - slice n characters from the end, set to right_digits
#   - rotate right_digits 
#   - append right_digits to number 
#   - transform number back to an integer and return 

def rotate_array(array)
  clone = array.dup
  first_el = clone.shift
  clone << first_el
end 

def rotate_rightmost_digits(number, n)
  number = number.to_s 
  right_digits = number.slice!(-n, n).chars
  number << rotate_array(right_digits).join('')
  number.to_i
end 

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
