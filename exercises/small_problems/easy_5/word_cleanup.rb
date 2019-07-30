
# input : a string
# output: The same string that replaces all non-alphanumeric characters with spaces
# maximum one space for multiple non-alphanumeric characters in a row.

# alg:
#     split input string into an array
#     initialize a switch variable
#     iterate through the array and push alphanumeric characters to a new array
#     if the current character is non-alphanumeric character && the switch is off (0) 
#       push a space (' ') to the new array
#       set the switch to on (1)
#     elsif the current character is non-alphanumeric && the switch is on (1)
#       next
#     join the new array 
def cleanup(string)
  switch = 0
  clean_string = []
  string.downcase.chars.map do |char|
    case ('a'..'z').cover?(char)
    when true
      clean_string << char
      switch = 0
    when false
      next if switch == 1
      clean_string << ' '
      switch = 1 
    end
  end
 clean_string.join
 end

puts cleanup("--what's my +*& line?")
