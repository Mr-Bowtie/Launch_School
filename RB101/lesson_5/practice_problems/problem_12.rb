arr = [[:a, 1], %w[b two], ['sea', { c: 3 }], [{ a: 1, b: 2, c: 3, d: 4 }, 'D']]

new_hash = arr.each_with_object({}) { |el, memo| memo[el[0]] = el[1] }

p new_hash
