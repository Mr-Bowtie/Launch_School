# INPUT: A string
# OUTPUT: new string with the cases of the characters swapped
# RULES:
#   - uppercase characters swapped with lowercase and vice versa
#   - non letters characters unaffected
# ALGORITHM:
#   - split string into array of characters, set as char_array
#   - iterate over char_array
#     - convert letters to ASCII values
#     - reassign values to match swapped case
#   - convert array back to string and return

LOWERCASE_VALUES = 65..90
UPPERCASE_VALUES = 97..122

LETTER_CONVERSION_VALUE = 32 #every letters ASCII is 32 away from its opposite cased counterpart

def swapcase(string)
  ordinal_array = string.chars.map(&:ord).map do |el|
    if LOWERCASE_VALUES.include?(el)
      (el + LETTER_CONVERSION_VALUE).chr
    elsif UPPERCASE_VALUES.include?(el)
      (el - LETTER_CONVERSION_VALUE).chr
    else
      el.chr
    end
  end
  ordinal_array.join
end

p swapcase("CamelCase") == "cAMELcASE"
p swapcase("Tonight on XYZ-TV") == "tONIGHT ON xyz-tv"

#* oh boy did I overthink this one, could've just used upcase and downcase again just like the LS solution. just using ranges for lowercase and uppercase
