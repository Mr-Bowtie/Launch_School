# INPUT: a two dimensional array 
#   - each element is an array 
#     -containing a string = fruit and an integer = number of that fruit 
# OUTPUT: A new one-dimensional array 
#   - containing the correct number of each fruit 
#   - the strings are repeated a number of times equal to the number in their input array 
# ALGORITHM: 
#   - create an empty shopping_list array 
#   - iterate over input
#     - push the fruit string into the shopping_list the number of times == the quantity integer
#   - return shopping_list 

   
def buy_fruit(list)
 list.each_with_object([]) do |fruit_info, shopping_list|
  fruit, quantity = fruit_info[0], fruit_info[1]
  quantity.times {shopping_list << fruit}
 end 
end 

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]