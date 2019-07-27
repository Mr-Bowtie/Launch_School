def swap(string)
  swap_string = string.split(' ').map do |e|
    char_arr = e.chars
    chr1 = char_arr.slice!(e.length - 1)
    char_arr.unshift(chr1)
    chr2 = char_arr .slice!(1)
    char_arr << chr2
  end
  swap_string
end 

# puts swap('Abcde')
puts swap('Oh what a wonderful day it is')
puts swap('a')

#mine did not work and got stupid. I really need to bone up on the fundamentals here. 
#ls solution
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0] #use of multi assignment and reverse index!
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
