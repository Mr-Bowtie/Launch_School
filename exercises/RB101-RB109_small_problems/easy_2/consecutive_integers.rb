def prompt(message)
  puts "-> #{message}"
end

def get_num
  prompt("Please enter an integer greater than 0")
  loop do
    user_num = gets.chomp.to_i
    if valid_num?(user_num)
      return user_num
    else
      prompt("please enter a valid number")
    end 
  end 
end 

def valid_num?(num)
  num.integer? && num > 0 
end 

def valid_choice?(choice)
  %w(s p).include?(choice)
end

def get_compute_choice
  prompt "Enter 's' to compute the sum, 'p' to compute the product."
  loop do 
    answer = gets.chomp
    if valid_choice?(answer)
      return answer
    else
      prompt("Please enter a valid response (only s or p)")
    end 
  end 
end 

def compute(num, choice)
  if choice == 's'
    (1..num).reduce(:+)
  elsif choice == 'p'
    (1..num).reduce(:*)
  end 
end

def display_result(choice,init_num, final_num)
  if choice == 's'
   prompt "the sum of the integers between 1 and #{init_num} is #{final_num}"
  elsif choice == 'p'
    prompt "The product of the integers between 1 and #{init_num} is #{final_num}"
  end
end 

num = get_num
choice = get_compute_choice
result = compute(num, choice)
display_result(choice, num, result)
    
