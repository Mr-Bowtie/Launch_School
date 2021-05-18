def prompt(message)
  puts "-> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def grab_num_array
  num_array = []
  num_prefix = { 1 => 'st', 2 => 'nd', 3 => 'rd', 4 => 'th', 5 => 'th' }
  for i in (1..5)
    prompt "Enter your #{i}#{num_prefix[i]} number"
    loop do
      num = gets.chomp
      if integer?(num)
        num_array << num.to_i
        break
      else
        prompt 'Integers only please.'
      end
    end
  end
  num_array
end

def grab_reference_num
  prompt 'please enter your final number'
  loop do
    reference_num = gets.chomp
    if integer?(reference_num)
      return reference_num.to_i
    else
      prompt 'Integers only please.'
    end
  end
end

def display_result(ref, array)
  if array.include?(ref)
    prompt "#{ref} appears in #{array}"
  else
    prompt "#{ref} does not appear in #{array}"
  end
end

array = grab_num_array
ref = grab_reference_num
display_result(ref, array)
