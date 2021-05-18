# def running_total(array)
#   memo = 0
#   array.map { |e| memo += e }
# end

# each_with_object

# def running_total(array)
#   memo = 0
#   array.each_with_object([]) {|i,a| a << memo += i  }
# end

#inject

def running_total(array)
  total = []
  array.reduce(0) do |e, i|
    total << e + i
    e + i
  end
  total
end

puts running_total([2, 5, 13])
puts running_total([3])
puts running_total([])
puts running_total([14, 11, 7, 15, 20])
