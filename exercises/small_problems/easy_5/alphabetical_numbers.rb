
#create a hash to store all the integers as keys with their word equivalent as values.
# initilize alpha_array 
# iterate over the array given using the <=> operator to compare the current value with the last value push to
# the alpah_array
# delete an element once it's pushed to alpha_array, continue looping until the initial array is empty.
NUMBER_WORDS = {0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six',
                7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve',
                13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
                18 => 'eighteen', 19 => 'nineteen'}

def alphabetic_number_sort(array)
  alpha_array = []
  until array.empty?
    memo = array[0]
    array.each do |num|
      case NUMBER_WORDS[memo] <=> NUMBER_WORDS[num]
      when 1
        memo = num
      else
        next
      end
    end
     alpha_array << array.delete(memo)
  end
  alpha_array
end 


puts alphabetic_number_sort((0..19).to_a)
puts alphabetic_number_sort([0,1,5,8,9,12])
