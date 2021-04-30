arr = [["b", "c", "a"], [2, 1, 3], ["blue", "black", "green"]]
sorted_arr = arr.map do |el|
  el.sort.reverse
end

p sorted_arr
