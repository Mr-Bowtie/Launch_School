def tip_calc(bill, percent)
  tip = (bill * (percent / 100)).round(2)
  total = (bill + tip)

  puts "the tip is $#{'%.2f' % tip}"
  puts "the total is $#{'%.2f' % total}"
end

print 'What is the bill? -> '
subtotal = gets.chomp.to_f
print 'What is the tip percentage? -> '
tip_percent = gets.chomp.to_f

tip_calc(subtotal, tip_percent)
