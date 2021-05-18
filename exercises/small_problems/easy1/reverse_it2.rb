#P : input - a string, output - a string with all 5 letter words reversed in place.
#each string should only contain letters and spaces. only include spaces when
#more than one word is present. maintain capitalization even when reversed.

#E :
#reverse_words('Professional')
#reverse_words("123")
#reverse_words()
#reverse_words('what is around the corner')

#D : store the words in an array then join them back into a string

#A : validate input, if valid - split string into an array. iterate through
#said array. if a word is 5 letters or more, reverse it. then join the array
#together.

def reverse_words(words = ' ')
  if words.to_s =~ /\d+/
    puts 'Invalid input: only letters and spaces allowed.'
  else
    array = words.split.map { |x| x.length >= 5 ? x.reverse : x }
    array.join(' ')
  end
end

puts reverse_words('Professional')
puts reverse_words('123')
puts reverse_words
puts reverse_words('what is around the corner')
puts reverse_words('Launch School')
