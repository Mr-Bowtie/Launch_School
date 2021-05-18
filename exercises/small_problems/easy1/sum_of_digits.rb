#P: input - a positive integer, output - the sum of its digits

#E:
#puts sum(23) == 5
#puts sum(496) == 19
#puts sum(123_456_789) == 45

#D: strings stored in an array

#A: convert integer into a string, then split into an array of it's characters
#return the sum of that string.

#C:
def sum(num)
  num.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
