#take in two arguments, a string and a positive integer
#prints the string a number of times equal to the value of the integer
#integer has to be positive, first argument HAS to be a string

#convert first paramater to string
#validate second parametr is a positive integer.
#iterate over string a number of times == num
#puts string that many times

def repeat(string, num)
string = string.to_s
  if num.to_i.positive?
    num
  else
    puts "invalid input, integer must be positive"
    return
  end
num.times {puts string}
end

#repeat('hey', 3)
#repeat([hey], 2)
#repeat('hey', -1)
#repeat('hey', 0)
repeat(3, 'hey')
#repeat(:what, 3)
