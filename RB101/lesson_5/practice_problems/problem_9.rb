arr = [%w[b c a], [2, 1, 3], %w[blue black green]]
sorted_arr = arr.map { |el| el.sort.reverse }

p sorted_arr
