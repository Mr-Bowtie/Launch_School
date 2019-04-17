require 
def prompt(message)
  puts "-> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def grab_loan
  prompt 'How much would you like to borrow?'
  loop do
    loan_amount = gets.chomp
    if integer?(loan_amount) && loan_amount.to_i > 0
      return loan_amount.to_i
    else
      prompt "Invalid input: please enter a positive whole number "
    end
  end
end

def grab_apr
  prompt "Next, the interest rate (APR %)"
  loop do
    apr = gets.chomp
    if /^\d*\.?\d*$/.match(apr) && /\d+/.match(apr) && apr.to_f > 0
      return apr.to_f / 100
    else
      prompt 'Please enter a valid APR (5, 23.6, etc)'
    end
  end
end

def grab_term
  prompt "Finally, the desired length of the loan in years, please."
  loop do
    loan_years = gets.chomp
    if (integer?(loan_years) || float?(loan_years)) && loan_years.to_f > 0
      loan_months = (loan_years.to_f * 12)
      loan_months = (loan_months + 1).to_i if !integer?(loan_months)
      return loan_months
    else
      prompt 'Invalid input'
    end
  end
end

def calculate_payment(loan, apr, term)
  monthly_rate = apr / 12
  loan * (monthly_rate / (1 - (1 + monthly_rate)**-term))
end

def show_payment(monthly_payment)
  prompt "Your payment would be #{monthly_payment}"
end

def redo?
  prompt 'Would you like to calculate another mortgage? y/n?'
  loop do
    answer = gets.chomp
    if %(y n).include?(answer)
      return answer == 'y'
    end
    prompt 'invalid: y or n only'
  end
end

prompt 'Welcome to the Mortgage calculator. Lets get started!'
loop do
  loan = grab_loan
  apr = grab_apr
  term = grab_term
  monthly_payment = calculate_payment(loan, apr, term)
  show_payment(monthly_payment.truncate(2))

  break unless redo?
end
prompt 'Thank you for using the mortgage calculator! Goodbye.'
