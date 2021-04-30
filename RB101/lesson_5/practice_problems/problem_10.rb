starter_arr = [{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }]
new_arr = starter_arr.map do |hsh|
  hsh.transform_values { |num| num + 1 }
end

p new_arr

# I did a little method hunting with this one if I'm honest. I got a bit stuck, but I do see the more basic approach of creating an empty object and iterating through the hash to push new values to the empty object.
