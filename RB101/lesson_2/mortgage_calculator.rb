require 'yaml'
MESSAGES = YAML.load_file("mortgage_calc_messages.yml")

def prompt(message)
  puts "-> #{MESSAGES[message]}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def grab_loan
  prompt 'get_loan'
  loop do
    loan_amount = gets.chomp
    if valid_loan?(loan_amount)
      return loan_amount.to_i
    else
      prompt 'invalid_loan'
    end
  end
end

def valid_loan?(input)
  integer?(input) && input.to_i > 0
end

def grab_apr
  prompt 'get_apr'
  loop do
    apr = gets.chomp
    if valid_apr?(apr)
      return apr.to_f / 100
    else
      prompt 'invalid_apr'
    end
  end
end

def valid_apr?(input)
  /^\d*\.?\d*$/.match(input) && /\d+/.match(input) && input.to_f > 0
end

def grab_term
  prompt 'get_term'
  loop do
    loan_years = gets.chomp
    if valid_term?(loan_years)
      loan_months = (loan_years.to_f * 12)
      return loan_months
    else
      prompt 'invalid_term'
    end
  end
end

def valid_term?(input)
  (integer?(input) || float?(input)) && input.to_f > 0 &&
    valid_increments?(input)
end

def valid_increments?(input)
  return true if integer?(input)
  /^\d*\.25$/.match(input) || /^\d*\.5$/.match(input) ||
    /^\d*\.50$/.match(input) || /^\d*\.75$/.match(input)
end

def calculate_payment(loan, apr, term)
  monthly_rate = apr / 12
  loan * (monthly_rate / (1 - (1 + monthly_rate)**-term))
end

def show_payment(monthly_payment)
  prompt('show_payment')
  puts "--> #{monthly_payment}"
end

def redo?
  prompt 'redo'
  loop do
    answer = gets.chomp.downcase
    if valid_redo_answer?(answer)
      return answer == 'y'
    end
    prompt 'invalid_redo'
  end
end

def valid_redo_answer?(input)
  %(y n).include?(input)
end

prompt 'welcome'
loop do
  loan = grab_loan
  apr = grab_apr
  term = grab_term
  monthly_payment = calculate_payment(loan, apr, term)
  show_payment(monthly_payment.truncate(2))
  break unless redo?
end
prompt 'goodbye'
