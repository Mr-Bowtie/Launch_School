def prompt(msg)
  puts "-> #{msg}"
end

def multiply(num1, num2)
  product = num1 * num2
end 

def square(num)
  multiply(num, num)
end 

def exponent(num, power)
  memo = num 
  (power - 1).times {memo = multiply(memo, num)}
  memo
end

prompt exponent(3,4e)
