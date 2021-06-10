# INPUT: an odd integer - n
# OUTPUT: a diamond output to the screen that is in an n by n grid 
# RULES : 
#   - the center row will be full width 
#   - each row will have 2 more characters than the last, or 2 less if its after the middle row 
# ALGORIGTHM: 
#   - start an incrementer at 1 
#   - loop n times 
#     - create a line 
#       - spaces = n - incrementer 
#       - half spaces + star * incrementer + half spaces 
#     - increment by 2 until  it equals n 
#     - then decrement by 2 

require 'pry'
STAR = '*'

def display_line(star_count, space_count)
  half_spaces = space_count / 2
  if star_count == 1 
    puts STAR.center(space_count + 1)
  else 
    puts (" " * half_spaces) + STAR + (" " * (star_count - 2)) + STAR + (" " * half_spaces)
  end 
end 

def diamond(grid_size)
  mid_point = (grid_size / 2) + 1
  incrementer = 1
  1.upto(grid_size) do |rep|
    # binding.pry
    display_line(incrementer, (grid_size - incrementer))
    rep < mid_point  ? incrementer += 2 : incrementer -= 2
  end 
end 

diamond(1)
diamond(3)
diamond(9)
diamond(25)
