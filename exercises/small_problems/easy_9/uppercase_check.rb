# INPUT: string
# OUTPUT: boolean
#   - representing whether all alphbetic characters are uppercase or not
# RULES:
#   - non-alphabetic characters should be ignored
# ALGORITHM:
#   - split string
#   - select only alphabetic characters
#   - check if all characters are uppercased
#   - return true or false based on the result

def uppercase?(string)
  letters = string.chars.select { |char| char.match?(/[a-zA-Z]/) }
  letters.all? { |letter| letter.match?(/[A-Z]/) }
end

p uppercase?("t") == false
p uppercase?("T") == true
p uppercase?("Four Score") == false
p uppercase?("FOUR SCORE") == true
p uppercase?("4SCORE!") == true
p uppercase?("") == true
