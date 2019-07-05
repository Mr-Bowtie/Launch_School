def prompt(msg)
  puts "-> #{msg}"
end

prompt "Please write a word or a sentence."
string = gets.chomp
string_chars = string.chars

if !string.include?(" ")
  length = string_chars.length
else
  string_chars.delete(" ")
  length = string_chars.length
end 
 
prompt "there are #{length} characters in \"#{string}\""

#did not realize delete could be used on a string
#also delete returns the modified string when called on a string, but returns the deleted characters whenn
#called on an array. 

