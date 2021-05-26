# INPUT: a string
# OUTPUT: a new string with each character doubled
# RULES:
#   1. doubling includes non-alphanumeric characters
# ALGORITHM:
#   - create doubled_string variable
#   - loop over input string
#     - conact and reassign doubled_string with current char doubled_string
#   - return doubled_string

def repeater(string)
  doubled_string = ""
  string.chars.each { |char| doubled_string += (char + char) }
  doubled_string
end

p repeater("Hello") == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater("") == ""
