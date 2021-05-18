numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers, even_numbers = numbers.partition { |number| number.even? }
p odd_numbers

p even_numbers
