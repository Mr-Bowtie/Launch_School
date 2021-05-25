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

user_responses = {}

print "Enter a noun: "
user_responses[:noun] = gets.chomp
print "Enter a verb: "
user_responses[:verb] = gets.chomp
print "Enter an adjective: "
user_responses[:adjective] = gets.chomp
print "Enter an adverb: "
user_responses[:adverb] = gets.chomp

final_sentence = "As I #{user_responses[:verb]} #{user_responses[:adverb]} up the \
#{user_responses[:noun]}, I feel positively #{user_responses[:adjective]}"

puts final_sentence
