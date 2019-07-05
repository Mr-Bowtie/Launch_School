def shout_greeting(name)
  puts "HI #{name}, WHAT ARE YOU DOING HERE!?"
end

def greeting(name)
  puts "Well hey there, #{name}. "
end

puts "Hey, whats your name?"
name = gets.chomp

if name.split("").values_at((name.length) - 1).include?("!")
  name = name.split("")
  name.pop
  name = name.join.upcase
  shout_greeting(name)
else
  greeting(name)
end
