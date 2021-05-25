# INPUT: string
# OUTPUT: array of substrings
# RULES:
#   1. array will contain all substrings starting with the first character of the given string
#   2. array must me sorted from short to long
# ALGORITHM:
#   1. create sub_array
#   2. create current_substring
#   3. loop over string
#     - append current letter to current_substring
#     - push current_substring to sub_array
#   4. return sub_array

def leading_substrings(string)
  sub_array = []
  current_substring = ""
  string.length.times do |index|
    current_substring += string[index]
    sub_array << current_substring
  end
  sub_array
end

p leading_substrings("abc") == ["a", "ab", "abc"]
p leading_substrings("a") == ["a"]
p leading_substrings("xyzzy") == ["x", "xy", "xyz", "xyzz", "xyzzy"]
