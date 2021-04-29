def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

stars_1 = ["Sirius", "Rigel", "Vega", "Polaris", "Altair"]
p star_method(stars_1)
