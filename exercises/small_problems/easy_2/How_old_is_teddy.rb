def display_teddy(age, name)
  name = "Teddy" if name.empty?
  puts "#{name} is #{age} years old!"
end

age = rand(20..200)

puts "Give me a name"
name = gets.chomp

display_teddy(age, name)
