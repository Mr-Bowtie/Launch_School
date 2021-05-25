# PROBLEM:
#   - input: strings from user
#   - output: short story with users words interpolated in
#   - Rules:
#     1. whatever the user inputs is added to the final result
#     2. no validation
# EXAMPLE:
#   Enter a noun: dog
#   Enter a verb: walk
#   Enter an adjective: blue
#   Enter an adverb: quickly

#   Do you walk your blue dog quickly? That's hilarious!'
# DATA: strings- user input stored in a hash
# ALGORITM:
#   1. create empty hash for user responses
#   2. display questions
#   3. capture user responses
#   4. display new string with user responses interpolated in

def prompt(key)
  if key.to_s[0].match?(/[aeiou]/)
    print "Enter an #{key.to_s}: "
  else
    print "Enter a #{key.to_s}: "
  end
end

user_responses = { noun: "", verb: "", adjective: "", adverb: "" }

user_responses.each do |k, v|
  prompt(k)
  user_responses[k] = gets.chomp
end

final_sentence = "As I #{user_responses[:verb]} #{user_responses[:adverb]} up the \
#{user_responses[:noun]}, I feel positively #{user_responses[:adjective]}"

puts final_sentence
