# INPUT: a string
# OUTPUT: a hash with 3 entries
#   1. the number of lowercase letters
#   2. the number of uppercase letters
#   3. number of characters that are neither
# RULES:
#   - strings characters are jumbled
#   - string can be any length
#   - space counts as a character
# ALGORITHM:
#   - initialize letter_count hash with proper keys and values of 0
#   - count number of lowercase characters
#     - update letter_count lowercase value
#   - count number of uppercase characters
#     - update letter_count uppercase value
#   - count number of non-letter characters
#     - update letter_count non-character value
#   - return letter_count

def letter_case_count(string)
  letter_count = { lowercase: 0, uppercase: 0, neither: 0 }
  letter_count[:lowercase] = string.count('a-z')
  letter_count[:uppercase] = string.count('A-Z')
  letter_count[:neither] = string.count('^a-z', '^A-Z')
  letter_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
