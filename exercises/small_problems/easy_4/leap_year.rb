# def leap_year?(year)
#   if year % 100 == 0 && year % 400 == 0
#     true
#   elsif year % 4 == 0 && !(year % 100 == 0)
#     true
#   else
#     false 
#   end
# end

# further exploration

# the rewritten example will fail for years divisible by 400 since they are also
# divisible by 100 and will return false before passing to the second statement.

# method test reversal

# def leap_year?(year)
#   if year % 4 == 0
#     return true unless year % 100 == 0 && year % 400 != 0
#   end
#  false
# end 

# part 2

def leap_year?(year)
  case year >= 1752
  when true
    if year % 4 == 0 
      return true unless year % 100 == 0 && year % 400 != 0
    end
    false
  when false
    year % 4 == 0 ? true : false
  end 
end 




puts leap_year?(2016)
puts leap_year?(2015)
puts leap_year?(2100)
puts leap_year?(240000)
puts leap_year?(1)
puts leap_year?(400)
puts leap_year?(1700)
puts leap_year?(1752)


#
