# INPUT: number
#   - positive or negative
# OUTPUT: number
#   - negative if input positive
#   - input itself if negative or 0
# ALGORITHM:
#   - if input is negative
#     - return input
#   - otherwise
#     - return negative input

def negative(int)
  if int.negative? || int == 0
    return int
  else
    return int * -1
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
