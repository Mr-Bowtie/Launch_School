#1.
# when the variables are assigned an alias, they both reference the same object, so the a same object id
# It's when the variables are assigned new values that they are also assigned new object id's

#2.
# values are passed into methods and are then assigned names to be used within the method but are seperate from
# names
# outside the method. so any change in object ids within a method will not be reflected to variables with the
# same
# names outside a method

#3.
#prediction: my_string will display "pumpkins" because the reassignment is happening within the method, and not
#on the outer scope. my_array will display ["pumpkins", "rutabaga"] because << is mutating,
#outcome: RIGHT! the internal method variable now points to a different object id, while both my_array and
#an_array_param both point to the same object because it was modified in place (mutated).

#4. the same result just switched the array and string

#5. dont understand the problem. What is easier? why is it coincidental that the argument is modified? isnt it
# very intentional based on the methods used inside the method definition?

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param += ['rutabaga']

  return a_string_param, an_array_param
end

my_string = 'pumpkins'
my_array = ['pumpkins']
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# so they were looking for the program to be consistent and explicit in its execution and handling of objects.

#6.
#  attempt
def color_valid(color)
  (color == 'blue' || color == 'green') ? true : false
end

#answer
def color_valid(color)
  color == 'blue' || color == 'green'
end
# this is a boolean expression and will return true or false automatically.
