#P: method accepts an array of positive integers, returns the average of all
#the numbers in the array. the array will never be empty and the numbers
#will always be positive integers.

#E:
#puts average([1, 5, 87, 45, 8, 8]) == 25
#puts average([9, 47, 23, 95, 16, 52]) == 40

#D: use arrays

#A: get a count of elements in the array, sum the elements, divide by the
#result of the element count.

def average(array)
  array.sum / array.count.to_f
end

puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) # == 40
puts average([1, 5, 87])
puts average([9, 95, 16, 52, 35, 18, 35, 90])
