def prompt(msg)
  puts "-> #{msg}"
end

#1st option
def oddities(array)
  odd_array = []
  array.each_with_index { |e, i| odd_array << e if i % 2 == 1 }
  odd_array
end

#2nd solution
def oddities2(array)
  odd_array = []
  for i in (0..(array.size - 1))
    #just array.size for the evens
    odd_array << array[i] if i % 2 == 0
  end
  odd_array
end

#3rd solution
def oddities3(array); end

prompt(oddities2([1, 2, 3, 4, 5, 6]))
prompt(oddities2([]))
