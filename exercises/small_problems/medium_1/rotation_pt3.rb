# INPUT: an integer 
# OUTPUT: the maximum rotation of that integer 
# RULES: 
#   - leading zeros should be dropped 
#   - there wont be a test with multiple 0's
#   - a single integer with return itself
# ALGORITHM:
#   - loop n times, where n is the number of digits in the input, starting at n and decrementing to 2 
#     - rotate the last n digits 
#     - decrement
#     - next 
#   - return max rotated number

def rotate_array(array)
  clone = array.dup
  first_el = clone.shift
  clone << first_el
end 

def rotate_rightmost_digits(number, n)
  number = number.to_s 
  right_digits = number.slice!(-n, n).chars
  number << rotate_array(right_digits).join('')
  number
end 

def max_rotation(number)
  num_length = number.to_s.length
  num_length.downto(2) do |i|
    number = rotate_rightmost_digits(number, i)
  end 
  number.to_i
end 

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10023001) #== 02010031