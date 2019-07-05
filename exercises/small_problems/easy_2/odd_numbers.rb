#first solution

# for i in (1..99)
#   puts i if i.odd?
# end

#second solution


a = (1..99).to_a.select{ |x| puts x if x % 2 != 0}
