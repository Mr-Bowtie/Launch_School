#1. it would print out
#-> 1
#-> 2
#-> 2
#-> 3
#the uniq method does not mutate the caller.

#2. 1. != is the not equal boolean operator. you would use it anytime you want to exc#ldue a value or check that an object does not equal a certain value.
#   2. ! is the not boolean operator, it returns the opposite boolean value of what
#      ever is passed.
#   3. ! appended on some methods changes them to destructive methods.
#   4. ? before something draws a syntax error.
#   5. ? after some methods denotes a boolean return value.
#   6. !! denotes not not, or a double negative, thus return the original value of
#      the argument.

##   to clariyf: !!<some object> - turns the object into its boolean equivalent
#                !<some object> - turns an object into the opposite of its boolean equivalent.

#3.
advice.gsub!("important", "urgent")

#4.numbers.delete_at(1) will delete the element the specified index.
#  numbers.delete(1) will delete all elements whose values match
#

#5.
(10..100).inlcude?(42)

#6.
#1.
famous_words = "seven years ago..."
famous_array = famous_words.split(" ")
famous_array.unshift("Four", "score", "and")
famous_words = famous_array.join(" ")
#2.
famous_words = "seven years ago..."
prepend = "Four score and "
famous_words = prepend + famous_words

#7 NEED TO EXPLORE FURTHER

#8
flintstones.flatten!

#9.
