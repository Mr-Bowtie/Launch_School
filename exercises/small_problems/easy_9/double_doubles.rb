# INPUT: integer
# OUTPUT: integer
#       - double the input integer
#       - unless it is a double number
#         - then the number itself
# RULES:
#   - double numbers are even integers whose left side digits are the same as the right side digits
# ALGORITHM:
#   - determine if input is a double number
#   - if not, return input * 2
#   - if yes, return input

def twice(int)
  if double?(int)
    return int
  else
    return int * 2
  end
end

def double?(int)
  return false if int.to_s.length.odd?
  half_length = (int.to_s.length / 2)
  front_half = int.to_s.slice(0, half_length)
  front_half * 2 == int.to_s
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
