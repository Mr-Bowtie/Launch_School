# input : a string
# output : a hash whose keys are the size of the words in the string, and the values are the frequency of words of
# that size.
# alg:
#     initialize counter hash
#     split words in string into an array
#     iterate through the array determining the size of each element
#     if there is a key in the counter_hash that matches the size of teh current element, add 1 to it's value
#     if not, add it to the hash with a value of 1

# V1

# def word_sizes(string)
#   counter_hash = {}
#   string.split(' ').each do |word|
#     unless counter_hash.has_key?(word.size)
#       counter_hash[word.size] = 1
#     else
#       counter_hash[word.size] += 1
#     end
#   end
#   counter_hash
# end

#got it to work in one!
#as always LS solution is more simple. it uses Hash.new(0) to give a default value of 0 to any non-extisant keys
# and then they just add 1 for each word of that size.

# but we had very similar thought processes, so that's a win for me. :D
# #LS SOLUTION:
#  def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     counts[word.size] += 1
#   end
#   counts
# end

#V2

def word_sizes(string)
  counter_hash = {}
  string
    .split(' ')
    .each do |word|
      clean_word = word.delete('^A-Za-z')
      unless counter_hash.has_key?(clean_word.size)
        counter_hash[clean_word.size] = 1
      else
        counter_hash[clean_word.size] += 1
      end
    end
  counter_hash
end

puts word_sizes('four score and seven.')
puts word_sizes('')
puts word_sizes('hey diddle diddle, the cat and the fiddle!')
