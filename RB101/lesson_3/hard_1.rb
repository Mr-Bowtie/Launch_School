#1.
# predict: an error will be raised saying greeting is an uninitialized variable.
# answer: nil is returned. Whenever you initialize a variable within an if block, even if you dont execute that block, the variable is initialized to nil.

#2.
#predict: { a: 'hi'}
# answer: { a: 'hi there'}. Informal_greeting is a reference to the original object and the << method is mutating
# and therefore effects the original object.

#3.
#predict:
# A. one is one, two is two, three is three
# B. same
# C. one is two, two is three, three is one
#answer: RIGHT!

#4.
# attempt
def dot_separated_ip_address?(input_string)
  loop do
    if input_string.split('.').size == 4
      dot_separated_words = input_string.split('.')
      break
    else
      puts 'input invalid. Please enter valid IP address.'
    end
  end
  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    next if is_an_ip_number?(word)
    return false
  end
  return true
end

# suggested solution:
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

# gets rid of unecessary loop and if/else statment at the begininng that would be more likely be a validation methd
# to allow the user to reenter the ip address instead of having to re-run the program. also simplifies false return
# for evaluating ip_numbers.
