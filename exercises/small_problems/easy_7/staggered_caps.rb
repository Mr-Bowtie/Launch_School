# INPUT: string
# OUTPUT: new string with every other letter capitalized
# RULES:
#   -ignore non-letter characters
# ALGORITHM:
#   split string into array of characters
#   iterate over array
#     every other character is capitalized if it is a letter

def staggered_case(string)
  char_array = string.downcase.split("")
  staggered_string = ""
  char_array.each_with_index { |char, index|
    if index.even? && char.match?(/[a-zA-Z]/)
      staggered_string += char.upcase
    else
      staggered_string += char
    end
  }
  staggered_string
end

p staggered_case("I Love Launch School!") == "I LoVe lAuNcH ScHoOl!"
p staggered_case("ALL_CAPS") == "AlL_CaPs"
p staggered_case("ignore 77 the 444 numbers") == "IgNoRe 77 ThE 444 NuMbErS"
