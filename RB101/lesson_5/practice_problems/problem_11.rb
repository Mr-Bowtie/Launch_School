arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map { |el| el.select { |num| num % 3 == 0 } }

p new_arr
