# INPUT: a string 
#   - containing values (integers) and operations 
#   - must be performed in order they appear in the string
# OUTPUT: the result of the operations 
#   - only if the print command is given in the input string
#   - this is a stand alone program, the register would not be passed to anything else 
# RULES: 
#   - this program is a mini-language running from a stack (array contaning integer values) and a register that stores a value 
#   - the register will be initialized at 0 
#   - the stack will be initialized as an empty array 
#   - all program inputs will be correct
#   - start with a set of defined commands that will be part of the input program strings
# ALGORITHM
#   - initialize empty stack
#   - initialize register at 0 
#   - split program string into program_array
#   - iterate over program_array
#     - for each command run the appropriate routine (method)
  
def number?(string)
  string.to_i.to_s == string 
end 

def minilang(program)
  stack = []
  register = 0
  program_array = program.split(" ")
  program_array.each do |command|
    case command
    when 'PUSH'
      stack << register
    when "ADD"
      register = register + stack.pop
    when "SUB"
      register = register - stack.pop
    when "MULT"
      register = register * stack.pop 
    when "DIV"
      register = register / stack.pop 
    when "MOD"
      register = register % stack.pop
    when "POP"
      register = stack.pop
    when "PRINT"
      puts register
    else 
      register = command.to_i 
    end 
  end 
end 

minilang("3 PUSH 5 ADD PRINT")
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)