require 'yaml'

MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message, var = '')
  puts "=> #{MESSAGES[message]} #{var}"
end

def valid_int?(int)
  int.to_i.to_s == int
end

def valid_float?(float)
  float.to_f.to_s == float
end

def valid_number?(num)
  valid_int?(num) || valid_float?(num)
end

def valid_term?(term)
  valid_number?(term) && term.to_f % 0.25 == 0.0
end

def term_type_assigner(term)
  if term.to_i.to_s == term
    term.to_i
  elsif term.to_f.to_s == term
    term.to_f
  end
end

def valid_redo_input?(answer)
  answer == 'y' || answer == 'n'
end

def redo_calc
  prompt('redo')
  answer = ''
  until valid_redo_input?(answer)
    answer = gets.chomp.downcase
    case answer
    when 'y'
      return true
    when 'n'
      return false
    else
      prompt('invalid_redo')
    end
  end
end

def get_loan_amount
  prompt('get_loan')
  loan_amount = ''
  until valid_number?(loan_amount)
    loan_amount = gets.chomp
    prompt('invalid_loan') unless valid_number?(loan_amount)
  end
  loan_amount.to_i
end

def get_apr
  prompt('get_apr')
  apr = ''
  until valid_number?(apr)
    apr = gets.chomp
    prompt('invalid_apr') unless valid_number?(apr)
  end
  apr.to_f
end

def get_term
  prompt('get_term')
  loan_duration = ''
  until valid_term?(loan_duration)
    loan_duration = gets.chomp
    prompt('invalid_term') unless valid_term?(loan_duration)
  end
  term_type_assigner(loan_duration)
end

prompt('welcome')
loop do
  loan_amount = get_loan_amount
  apr = get_apr
  term_years = get_term
  monthly_rate = (apr.to_f / 1200)
  term_months = (term_years.to_i * 12)

  monthly_payment =
    loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-term_months)))

  prompt('show_payment', monthly_payment.round(2).to_s)
  break unless redo_calc
end
prompt('goodbye')
