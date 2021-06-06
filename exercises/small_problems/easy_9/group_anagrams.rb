# INPUT: an array of words 
#   - all are the same length 
# OUTPUT: print out arrays of words that are anagrams from the input array 
# RULES: 
#   - each line output should be one array consisting of one group of anagrams 
#   - need to print out all anagram groups 
# ALGORITHM
#   - loop until the array is empty 
#     - create an empty anagrams array
#     - take the first element out of the array and push it to the empty array 
#     - iterate over the input array  
#       - determine if current word is anagram of memo word 
#         - if so push current word to anagrams 
#         - if not next 
#     - print anagrams
#     - subtract anagrams from words
#   - end loop
require "pry"
def anagrams?(word1, word2)
  word1 = word1.split("").sort
  word2 = word2.split("").sort
  word1 == word2 
end 

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

until words.empty? do 
  anagrams = []
  current_word = words.shift
  anagrams << current_word
  words.each do |word|
    if anagrams?(current_word, word)
      anagrams << word 
    end 
  end 
  p anagrams
  words -= anagrams
end 