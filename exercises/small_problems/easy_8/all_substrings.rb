# INPUT: string
# OUTPUT: an array of substrings containing all substrings that start with each letter in sequential order
# RULES:
#   1. the substrings at a given position should be returned from short to long
#   2. use the method from leading substrings
# ALGORITHM:
#   1.create an all_sub_arrays variable with an empty array
#   2. loop over string
#     - generate starting sub-string starting at the index of the current iteration
#     - pass that into leading substrings
#     - push return value into all_sub_arrays
#   3. flatten and return all_sub_arrays

def leading_substrings(string)
  sub_array = []
  current_substring = ""
  string.length.times do |index|
    current_substring += string[index]
    sub_array << current_substring
  end
  sub_array
end

def substrings(string)
  all_sub_arrays = []
  string.length.times do |index|
    sub_string = string[index..-1]
    all_sub_arrays << leading_substrings(sub_string)
  end
  all_sub_arrays.flatten
end

p substrings("abcde") == [
  "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e",
]
