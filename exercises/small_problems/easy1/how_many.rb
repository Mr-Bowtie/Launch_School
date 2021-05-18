#P - input == an array, output is a list of elements and how many times
# those elements occur in the given array.
#elements must match exactly and are case sensitive.
#E -
vehicles = %w[car car truck car SUV truck motorcycle motorcycle car truck]

numbers = [1, 2, 2, 3, 42, 5, 3, 1, 42]

pets = ['cat', 'dog', 'Sugar', 'sugar', 'dog', 12, 12, 'Cat']

#D - store data as a hash since there will be values associated with
#each element.

#A -iterate over the given array and count how many times each elements
#occurs. store the result in a hash. key is the element, value is
#the number of occurences is the given array. output that data in a string.

#C-

def count_occurences(array = [])
  elements = {}
  array.each { |e| elements[e] = array.count(e) }
  elements.each { |key, value| puts "#{key} => #{value}" }
end

count_occurences(vehicles)
count_occurences(numbers)
count_occurences(pets)
count_occurences
