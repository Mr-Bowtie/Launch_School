def prompt(msg)
  puts "-> #{msg}"
end

def oddities(array)
  odd_array = []
  array.each_with_index { |e,i| odd_array << e  if i % 2 == 1}
  odd_array
end 

prompt(oddities([1,2,3,4,5,6]))
prompt(oddities([]))
