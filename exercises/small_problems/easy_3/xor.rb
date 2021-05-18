def xor?(arg1, arg2)
  if arg1 == true && arg2 == false
    true
  elsif arg2 == true && arg1 == false
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)
