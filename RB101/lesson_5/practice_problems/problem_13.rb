arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort do |a, b|
  a = a.select { |num| num.odd? }
  b = b.select { |num| num.odd? }
  a <=> b
end

p new_arr
