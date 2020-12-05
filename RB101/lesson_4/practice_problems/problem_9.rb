words = "the flintstones rock"

word_arr = words.split(" ")
word_arr.each { |word| word.capitalize! }
p words = word_arr.join(" ")
