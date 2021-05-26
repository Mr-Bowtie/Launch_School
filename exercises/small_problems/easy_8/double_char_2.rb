# INPUT: string
# OUTPUT: new string with each consonant doubled
# RULES:
#   - vowels, digits, punctuation and whitespace should not be doubled
# ALGORITHM:
#   - create doubled_consonants variable
#   - loop over string
#     - if character is a consonant double it and add it to doubled_consonants
#     - else add char to doubled_consonants
#   - return doubled_consonants

def double_consonants(string)
  double_con_string = []
  string.chars.each do |char|
    if char.match?(/[aeiouAEIOU]/)
      double_con_string << char
    elsif char.match?(/[a-zA-Z]/)
      double_con_string << char << char
    else
      double_con_string << char
    end
  end
  double_con_string.join
end

p double_consonants("String") == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants("") == ""
