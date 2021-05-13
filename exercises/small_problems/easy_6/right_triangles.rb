# INPUT: a positive integer (n)
# OUTPUT: a right triangle drawn with asterisks whose sides have n asterisks
# RULES:
#   - the hypotenuse should have one end at the lower-left, and the other at the upper-right
# ALGORITHM:
#   - iterate n times
#     - display (n - iterator cycle) spaces + iterator number stars

def triangle(num)
  num.times do |i|
    line = ""
    i += 1
    (num - i).times { line += " " }
    i.times { line += "*" }
    puts line
  end
end

triangle(5)
triangle(9)
