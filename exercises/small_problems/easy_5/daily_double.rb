def crunch(string)
  index = 0
  memo = ''
  string.each_char do |chr|
    string.slice!(index) if chr == memo
    index += 1 unless chr == memo
    memo = chr
  end
  string
end 

puts crunch('dddaaaiiily ddouuubllee')
puts crunch('555abcabcabc')
puts crunch('a')
puts crunch('')
