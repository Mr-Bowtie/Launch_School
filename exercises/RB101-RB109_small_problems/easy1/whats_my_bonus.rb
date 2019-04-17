#P input - two arguments, 1st a positive integer, 2nd a boolean
# output- if the boolean is true, return half the given integers
#if false, return 0

#E
#puts calculate_bonus(2800, true) == 1400
#puts calculate_bonus(1000, false) == 0
#puts calculate_bonus(50000, true) == 25000

#D: coded structure

#A: use ternary operator to halve integer if true, or return 0 if not

#C:
def calculate_bonus(num, boolean)
  boolean == true ? num / 2 : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
