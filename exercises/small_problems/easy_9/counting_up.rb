# INPUT: integer
# OUTPUT: an array
#   - contains integers 1 upto input
# RULES:
#   - input will always be a valid non-zero integer
# ALGORITHM:
#   - create int_sequence array
#   - iterate number of times equal to input
#   - and current iteration number to int_sequence
#   - return int_sequence

def sequence(int)
  int_sequence = []
  1.upto(int) { |i| int_sequence << i }
  int_sequence
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
