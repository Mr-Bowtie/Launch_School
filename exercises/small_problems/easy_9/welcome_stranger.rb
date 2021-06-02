# INPUT: Array
#       - 2 elements or larger
#       - elements are strings
#       Hash
#       - two keys
#         - title, and occupation
#       - values are strings
# OUTPUT: string
#         - a greeting that includes the person's full name
#         - mentions their title and occupation
# ALGORITHM:
#   - create a prompt template
#   - create a greeting template
#   - interpolate the name and job credentials into greeting template

def greetings(name_array, job_hash)
  name = name_array.join(" ")
  title = job_hash[:title]
  occupation = job_hash[:occupation]
  prompt "Hello, #{name}! Nice to have a #{title} #{occupation} around"
end

def prompt(string)
  puts "==| #{string}"
end

greetings(["John", "Q", "Doe"], { title: "Master", occupation: "Plumber" })
