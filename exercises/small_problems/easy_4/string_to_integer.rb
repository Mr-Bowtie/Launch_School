# convert a string to an integer
# all inputs will be numeric characters

# create hash to convert all single digit numeric strings to integer equivalent
# split characters into array
# iterate over array pulling values from hash for each character multiplying by factor of appropriate factor of 10
# for place in integer and reducing value to integer.  

def string_to_integer(str)
  num_hash = {'1' => 1, '2' => 2}
  num_hash[str[0]]
  num_hash[str[1]]
  
end

puts string_to_integer('12')
