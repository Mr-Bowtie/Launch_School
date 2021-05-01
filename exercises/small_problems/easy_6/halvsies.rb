# INPUT: an array
# OUTPUT: two sub arrays nested in an outer array
# RULES:
#   1. each sub array contains half of the original array
#   2. if the original array length is odd, the middle element is put in the first sub Array
#   3. if the original array has only 1 element, still return two sub arrays, the second is empty
#   4. if the original array is empty, return two empty arrays

def halvsies(arr)
  halved_arr = [[], []]
  arr.each_with_index do |num, index|
    if arr.length.even?
      if index < (arr.length / 2)
        halved_arr[0] << num
      else
        halved_arr[1] << num
      end
    else
      if index <= (arr.length / 2)
        halved_arr[0] << num
      else
        halved_arr[1] << num
      end
    end
  end
  halved_arr
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
