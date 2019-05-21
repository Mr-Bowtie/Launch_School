SQMETERS_TO_SQFEET = 10.7639
SQCENT_TO_SQINCH = 0.155
puts "Enter the length of your room in feet"
length = gets.chomp.to_f
puts "Enter the width of your room in feet"
width = gets.chomp.to_f

area_feet = (length * width).round(2)
area_inches = (area_feet * 144).round(2)
area_centimeters = (area_feet / (SQMETERS_TO_SQFEET / 10000)).round(2)


puts "The area of the room is:
      #{area_feet} square feet
      #{area_inches} square inches
      #{area_centimeters} square centimeters"
