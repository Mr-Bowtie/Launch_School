def prompt(msg)
  puts "-> #{msg}"
end

def multiply(num1, num2)
  product = num1 * num2
  prompt (product)
end 

def square(num)
  multiply(num, num)
end 

square(3)
