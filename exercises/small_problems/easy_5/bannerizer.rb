def print_in_box(string)
  box_length = string.size + 2
  puts '+' + '-' * box_length + '+'
  puts '|' + ' ' * box_length + '|'
  puts '|' + " #{string} " + '|'
  puts '|' + ' ' * box_length + '|'
  puts '+' + '-' * box_length + '+'
end

print_in_box('Hey there!')
print_in_box('Paint with all the colors of the wind')
print_in_box('')

#do further exploration!
