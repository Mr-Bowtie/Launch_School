current_year = Time.now.year

def prompt(message)
  puts "-> #{message}"
end

prompt 'How old are you?'
age = gets.chomp.to_i

prompt 'At what age would you like to retire?'
retirement_age = gets.chomp.to_i

years_left = retirement_age - age
retirement_year = YEAR + years_left

prompt "It's #{current_year}. You will retire in #{retirement_year}"
prompt "You only have #{years_left} years left of work to go!"
