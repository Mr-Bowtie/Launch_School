# INPUT: string
# OUTPUT: string with all substrings capitalized
# RULES:
#   - A word is any sequence of non-blank characters
#   - does not affect words whose first character is a non-letter
#   - first letter of each substring is capitalized
#   - the rest of the letters are lowercase
# ALGORITHM:
#   - split string by spaces, set array to words
#   - iterate over words
#     - reassign each substring to a downcased version
#     - capitalized each substring
#   - join words with spaces
#   - return words
require "pry"
#* v 1.0
# def word_cap(string)
#   words = string.split.map do |word|
#     word.capitalize
#   end
#   words.join(" ")
# end

#* further exploration part 1

def word_cap(string)
  capped_words = string.split.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    word
  end
  capped_words.join(" ")
end

#* couldn't think of a second alternate solution

p word_cap("four score and seven") == "Four Score And Seven"
p word_cap("the javaScript language") == "The Javascript Language"
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
