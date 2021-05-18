#input = positive number. ouput an array whose elements are the digits of the
#given number
#needs to be a positive number, cannot accept other data types
#raise exception if other data types are used
#returns an array, does not print it.
#returned array should be comprised of numbers, not strings

#algo: accept user input, validate input is valid (only postive integers)
#convert number to string and split out into an array. iterate through
#returned string to convert elements to integers

def digit_list(num = ' ')
  if num.to_s.to_i != num || num.negative?
    puts 'Invalid input: positive integers only'
    return
  end
  num.to_s.split('').map { |e| e.to_i }
end

puts digit_list(123)
puts digit_list(-13)
puts digit_list('hey')
puts digit_list(2_342_342_349_839)
puts digit_list
puts digit_list(5)
