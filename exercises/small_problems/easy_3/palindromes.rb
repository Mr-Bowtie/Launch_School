# input: string
# output: boolean true or false
# requires: method to factor spaces, punctuation, and capitalization into palindrome

#this method works for both strings and arrays.
def palindrome?(str)
  str.reverse == str
end

def real_palindrome?(str)
  string = str.downcase.delete('^a-z0-9')
  palindrome?(string)
  string
end

# puts real_palindrome?("Madam i'm adam")

def palindromic_number?(num)
  num = num.to_s
  palindrome?(num)
end

puts palindromic_number?(34_543)
puts palindromic_number?(123_454)
