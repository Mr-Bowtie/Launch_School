# INPUT: two arrays of integers
# OUTPUT: a new array with each element being the product of the two given arrays at the same index
# RULES: 
#   -There will only be two arrays 
#   - the two arrays will be of the same size
# ALGORITHM: 
#   - Create an empty array product_array 
#   - iterate times equivalent to input array size 
#     - multiply values of input arrays at iterator index 
#     - add result to back of product_array 

#* initial solution 

# def multiply_list(arr1, arr2)
#   product_array = []
#   arr1.size.times {|i| product_array << arr1[i] * arr2[i]}
#   product_array
# end 

#* Further exploration 

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|e| e.reduce(1, :*)}
end 

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]