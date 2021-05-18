#P - write a method that accepts a string and returns the words in the string
#in reverse order. Still as a string. only reverses the order of the words
#not the words themselves.

#D - split string into an array

#A - split given string into an array. reverse the array. convert the array
#into a string and return it.

#C -

def reverse_sentence(words)
  words.split.reverse.join(' ')
end

puts reverse_sentence('Yo, what up dawg') == 'dawg up what Yo,'
