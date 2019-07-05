# input: string
# output: boolean true or false
# requires: method to factor spaces, punctuation, and capitalization into palindrome


def palindrome?(str)
  str.reverse == str
end


#this method works for both strings and arrays. 
