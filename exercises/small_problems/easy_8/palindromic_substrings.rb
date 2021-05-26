# INPUT: string
# OUTPUT: array containing all substrings which are palindromes
# RULES:
#   1. case sensitive
#   2. one letter strings are not considered palindromes
#   3. return values should be arranged in order as in the string
# ALGORITHM:
#   - create sub_palindrome array
#   - set all_subs to output of substrings called on input string
#   - loop over all_subs
#     - add current element if palindrome?
#   - return sub_palindrome

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

def palindrome?(string)
  string == string.reverse && string.length > 1
end

def palindromes(string)
  sub_palindromes = []
  all_substrings = substrings(string)
  all_substrings.each do |sub|
    palindrome?(sub) ? sub_palindromes << sub : next
  end
  sub_palindromes
end

p palindromes("abcd") == []
p palindromes("madam") == ["madam", "ada"]
p palindromes("hello-madam-did-madam-goodbye") == [
  "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo",
]
p palindromes("knitting cassettes") == [
  "nittin", "itti", "tt", "ss", "settes", "ette", "tt",
]
