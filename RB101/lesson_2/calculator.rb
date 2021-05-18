require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def number_type_assigner(num)
  if num.to_i.to_s == num
    num.to_i
  elsif num.to_f.to_s == num
    num.to_f
  end
end

def operation_to_message(op)
  message =
    case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    else
      'Dividing'
    end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt "Hi #{name}"

loop do
  number1 = ''
  until valid_number?(number1)
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp
    prompt(MESSAGES['invalid']) unless valid_number?(number1)
  end
  number1 = number_type_assigner(number1)

  number2 = ''
  until valid_number?(number2)
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp
    prompt(MESSAGES['invalid']) unless valid_number?(number2)
  end
  number2 = number_type_assigner(number2)

  prompt <<-MSG
  #{MESSAGES['query_operators']}
    #{MESSAGES['add']}
    #{MESSAGES['subtract']}
    #{MESSAGES['multiply']}
    #{MESSAGES['divide']}
  MSG

  operation = ''
  loop do
    operation = gets.chomp
    if '1 2 3 4'.include?(operation)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  case operation
  when '1'
    result = number1 + number2
  when '2'
    result = number1 - number2
  when '3'
    result = number1 * number2
  when '4'
    result = number1 / number2
  else
    prompt(MESSAGES['invalid_operator'])
  end

  prompt "#{operation_to_message(operation)} #{MESSAGES['operating']}"

  prompt("#{MESSAGES[result]} #{result}")

  prompt(MESSAGES['redo'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "#{MESSAGES['thanks']} #{name}!"
