# convert a string to an integer
# all inputs will be numeric characters

# create hash to convert all single digit numeric strings to integer equivalent
# split characters into array
# iterate over array pulling values from hash for each character multiplying by factor of appropriate factor of 10
# for place in integer and reducing value to integer.  

# my solution

def string_to_integer(str)
  num_hash = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
  num_array = str.chars.map {|num| num_hash[num]}
  integer = 0
  iterator = 0
  while iterator < num_array.size
    iterator == num_array.size - 1 ? integer += num_array[iterator] :
      integer += (num_array[iterator] * (10 ** (num_array.size - iterator - 1)))
    iterator += 1
  end
  integer
end

# holy moly was mine overly complex. I had that feeling while i was writing it.
# it does the computation almost exactly backwards of the LS solution. Mine sets the proper number place before
# adding the next number. Theirs just multiplies the rolling value by ten each iteration, which does the same thing
# much more simply.
# also, static hashes and arrays to make the method work can be written outside of the method by storing it in a constant. 
# given LS  solution

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(string)
#   sign = string.slice!(0) if string[0] == '-' || string[0] == '+' # added for signed integers
#   digits = string.chars.map { |char| DIGITS[char] }


#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   sign == "-" ? value * (-1) : value # modified for signed integers, original: value 
# end

# p string_to_integer('12')
# p string_to_integer('-5432')
# p string_to_integer('+209383930')
# p string_to_integer('1')

#so i just modified the old method to accept signed integers instead of making a whole new method and using the
#first inside it. ...whoops

# LS solution to signed integers. This only works if using the string_to_integer method without modifications.   
                                                                          
# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# string[1..-1] refers to the values starting at index 1 going to the last character (-1). Negative indexes start
# from the end and go towards the beginning, but dont start with -0, cuz thats dumb i guess.




