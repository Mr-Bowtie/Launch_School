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
  if int.negative?
    return (int..1).to_a
  else
    return (1..int).to_a
  end
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-3) == [-3, -2, -1, 0, 1]
