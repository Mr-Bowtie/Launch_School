# INPUT: a multiword string 
#   - words are seperated by exactly one space 
#   - any substring of non-whitespace characters is a word
# OUTPUT: an array 
#   - each element is a string contanining a word from the input string 
#     - appended with a space and the length of the string in integer form 
#   - the array should be in the same order the strings appear in the input 
# ALGORITHM: 
#   - split the input by spaces into a words_array 
#   -  iterate over words_array 
#     - mutate the element to append a space and the strings length

def word_lengths(string)
  string.split(" ").map do |word|
    size = word.length 
    word + " #{size}"
  end 
end 

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []