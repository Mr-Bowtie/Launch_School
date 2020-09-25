require "yaml"
require "pry"
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message)
    puts "=> #{MESSAGES[message]}"
end

prompt('welcome')
prompt('get_loan')
loan_amount = gets.chomp.to_i
prompt('get_apr')
apr = gets.chomp
prompt('get_term')
loan_duration_years = gets.chomp

monthly_rate = (apr.to_f / 1200)
loan_duration_months = (loan_duration_years.to_i * 12)


puts monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_duration_months)))

