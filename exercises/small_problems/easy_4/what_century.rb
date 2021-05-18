def century(year)
  suffixes = {
    0 => 'th',
    1 => 'st',
    2 => 'nd',
    3 => 'rd',
    4 => 'th',
    5 => 'th',
    6 => 'th',
    7 => 'th',
    8 => 'th',
    9 => 'th'
  }
  year % 10 == 0 ? cen_num = (year / 100) : cen_num = (year / 100 + 1)
  if (11..13).include?(cen_num)
    suffix = suffixes[0]
  else
    suffix = suffixes[cen_num % 10]
  end
  century = cen_num.to_s + suffix
end

puts century(2000)
puts century(2001)
puts century(5)
puts century(10_103)
puts century(1152)

# the suffix appending should be pulled out into a seperate method
# hash for storing suffixes isnt very efficient since there's only 4 unique values
