# INPUT: 3 integers 
#   - all between 0 and 100 
# OUTPUT: A single character string 
#   - this represents the letter grade of the average of all the scores 
# ALGORITHM: 
#   - create a hash containing all the letter grades and their numerical ranges 
#   - find the average of the inputs 
#   - iterate over the hash and return the key corresponding to the range the average falls in
GRADES= {"A" => (90..100), "B" => (80..89), "C" => (70..79), "D" => (60..69), "F" => (0..59)}

def get_grade(g1, g2, g3)
  average = (g1 + g2 + g3) / 3
  
  grade_letter = ""
  GRADES.keys.each do |letter|
     if GRADES[letter].include?(average)
      grade_letter = letter 
     end 
  end 
  grade_letter
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"