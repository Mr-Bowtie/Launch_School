statement = 'The Flintstones Rock'
statement_array = statement.chars
statement_array.delete(' ')
statement_letters = {}
statement_array.each do |char|
  if statement_letters.has_key?(char)
    statement_letters[char] += 1
  else
    statement_letters[char] = 1
  end
end

p statement_letters
