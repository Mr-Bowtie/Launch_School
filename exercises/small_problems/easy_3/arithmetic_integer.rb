def prompt(message)
  puts "-> #{message}"
end

prompt 'Enter the first number'
a = gets.chomp.to_i

prompt 'Enter the second number'
b = gets.chomp.to_i

prompt "#{a} + #{b} = #{a + b}"
prompt "#{a} - #{b} = #{a - b}"
prompt "#{a} * #{b} = #{a * b}"
prompt "#{a} / #{b} = #{a / b}"
prompt "#{a} % #{b} = #{a % b}"
prompt "#{a} ** #{b} = #{a**b}"
