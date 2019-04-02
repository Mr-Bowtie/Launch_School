#P: input - positive integer. output - a string of alternating 1s and 0s always
#starting with 1. the length should match the given integer.

#E:
#stringy(0)
#stringy()
#stringy(14)
#stringy(-1)
#stringy(5)
#stringy(6)

#D: store data in an array

#A:validate input, iterate through a block a number of times equal
#to the integer given. put 1 on an odd number, put 0 on and even.
#push each iteration result to an array. join and return that array
#once the full iteration is complete.

#C:

def stringy(num=0,alt=1)
  bin = []
  if num.to_s.to_i != num || num.negative?
    puts "Invalid input: positive integers only"
    return
  else
    num.times do |x|
      if alt == 1
        a = x.even? ? 1 : 0
      else
        a = x.odd? ? 1 : 0
      end
      bin << a
    end
    bin.join
  end
end

puts stringy(0)
puts stringy()
puts stringy(14,0)
puts stringy(14)
puts stringy(-1)
puts stringy(5)
puts stringy(6,0)
puts stringy('hey')
