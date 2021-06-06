# INPUT: a string 
#   - contaning a first name, a space, and a last name 
# OUTPUT: a new string 
#   - new order 
#     - last name, comma, space, first name
# RULES: there will only ever be two substrings making up the input 
# ALGORITHM: 
#   - split string by spaces 
#   - interpolate substrings into new string in the correct order 

def swap_name(full_name)
  name_array = full_name.split(" ")
  "#{name_array[1]}, #{name_array[0]}"
end 

p swap_name('Joe Roberts') == 'Roberts, Joe'
