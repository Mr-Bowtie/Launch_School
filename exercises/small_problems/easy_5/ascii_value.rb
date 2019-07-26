def ascii_value(string)
 sum = 0
 string.chars.each {|e| sum += e.ord}
 sum
end

puts ascii_value('Four score')
puts ascii_value("Launch School")
puts ascii_value('a')
puts ascii_value('')
