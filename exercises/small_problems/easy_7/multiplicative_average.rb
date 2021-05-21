# INPUT: an array of integers 
# OUTPUT: an integer, the multiplicative average 
# RULES: 
#   - arrays will not be empty 
#   - multiply all elements together, then divide by # of elements 
#   - round to a precision of 3 decimal places 
# ALGORITHM: 
#   - reduce array to multiplied integer 
#   - divide by array size
#   - format to 3 decimal places 

def show_multiplicative_average(int_array)
printf("%.3f", int_array.reduce(1, :*).to_f / int_array.size)
end 

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667