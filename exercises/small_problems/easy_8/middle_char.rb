def center_of(string)
  middle_position = string.length / 2
  if string.length.odd?
    return string[middle_position]
  else
    return (string[middle_position - 1]) + string[middle_position]
  end
end

p center_of("I love ruby") == "e"
p center_of("Launch School") == " "
p center_of("Launch") == "un"
p center_of("Launchschool") == "hs"
p center_of("x") == "x"
