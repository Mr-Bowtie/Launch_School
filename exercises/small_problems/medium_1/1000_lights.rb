# INPUT: an integer 
#   - representing a total number of switches 
# OUTPUT: an array 
#   - containing the number position of switches left on 
# RULES: 
#   - on the first iteration, all switches are turned on 
#   - on each repetiion, all multiples of the current iteration number are toggled
#   - n will always be a positive integer larger than 1
# ALGORIGTHM: 
# - create an empty switches array 
# - loop n times starting value 1
#   - on the first iteration, add all switches, 1 to n 
#   - on all other iterations  
#     - initialize a multiples array that includes all multiples of the current iteration number that are less than n 
#     - iterate over multiples 
#       - if the current value exists in switches, remove it, if not, add it 
#   return switches 

def multiples(num, max)
  all_multiples = []
  1.upto(max) {|i| all_multiples << i if (i % num == 0)}
  all_multiples
end 

def flippy_switches(number_of_switches)
  switches = []
  1.upto(number_of_switches) do |rep|
    if rep == 1 
      1.upto(number_of_switches) {|num| switches << num}
    else 
      multiples(rep, number_of_switches).each do |multiple|
        switches.include?(multiple) ? switches.delete(multiple) : switches << multiple
      end 
    end 
  end 
  switches
end 

p flippy_switches(5) == [1,4]
p flippy_switches(10) == [1,4,9]
p flippy_switches(20) 
p flippy_switches(367) 
p flippy_switches(1000)