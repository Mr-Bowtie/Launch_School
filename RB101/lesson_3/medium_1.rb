#1.
10.times {|i| puts "The Flintstones rock!".prepend(" " * i)}

#2.
# you cant concatenate two different data types. you could either call .to_s on the integers or use string interpolation

#3.

# was unsure if they were asking to refactor the code or do it without a loop at all for the factor evaluation.
# the LS answer uses a while loop instead so it doesnt even run if the user inputs 0 or a negative number. where as a begin/end/until loop will always run at least once. 

# bonus 1 - number % divisor == 0 returns true if divisor divides into number leaving no remainder, meaning it is a divisor of that number.

#bonus 2 - putting factors as the last line of the method ensures the value of that variable will be the return value for the method, allowing it to be passed to other methods.

#4. << mutates the array given, + does not alter the input.

#5. the limit variable is not passed into the method definition and so is not available, either add it as an argument or initialize it in the definition.

#6. 34 - the method reassigns it's inner variable and it does not affect the outer scope variable. 

#7 no, the values in the hash were not affected by the internal method reassignment. (WRONG)
# reread variable reference articles

#8. paper
rps(rps(rps("rock","paper"), rps("rock","scissors")), "rock")
rps(rps("paper","rock"),"rock")
rps("paper","rock")
"paper"

#9. no
# the return value of foo is "yes" making bars ternary operator false returning "no"
