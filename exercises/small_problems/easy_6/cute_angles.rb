# INPUT: a floating point number
#   represents an angle between 0 and 360 degrees
# OUTPUT: a string
#   represents the angle in degrees, minutes, and seconds.
# RULES:
#  - a degree has 60 minutes
#  - a minute has 60 seconds
#  - must use two digit numbers with leading zeros for formatting the minutes and seconds
#  - an input of 360 can be read as 360degrees00'00" or 0degrees00'00"
#  - the number after the decimal represent part of 1 degree
# ALGORITHM:
#  - convert to string
#  - split input by decimal
#   - if extant
#  - set number left of decimal to degrees
#  - use number right of decimal to determine minutes and seconds
#     - set to indiviual variables
#  - format minutes and seconds to be two digit numbers with leading zeros
#  - join degrees. minutes, and seconds
#  - return full string.
DEGREE = "\xC2\xB0"
SECONDS_IN_DEGREE = 3600

def dms(angle)
  angle = angle.to_s
  if angle.include?('.')
    degree = angle.split('.').first
    float = ('.' + angle.split('.').last).to_f
    minutes = calculate_minutes(float)
    seconds = calculate_remaining_seconds(float)
    formatted_angle(degree, minutes, seconds)
  else
    degree = angle
    minutes = '00'
    seconds = '00'
    formatted_angle(degree, minutes, seconds)
  end
end

def calculate_minutes(float)
  (calculate_total_seconds(float) / 60).to_i
end

def calculate_total_seconds(float)
  SECONDS_IN_DEGREE * float
end

def calculate_remaining_seconds(float)
  (calculate_total_seconds(float) - (calculate_minutes(float) * 60)).to_i
end

def formatted_angle(degrees, minutes, seconds)
  if minutes.to_s.length > 1
    minutes = minutes.to_s
  else
    minutes = '0' + minutes.to_s
  end
  if seconds.to_s.length > 1
    seconds = seconds.to_s
  else
    seconds = '0' + seconds.to_s
  end
  degrees + DEGREE + minutes + "'" + seconds + "\""
end

puts dms(30) == "30°00'00\""
puts dms(76.73) == "76°43'48\""
puts dms(254.6) == "254°36'00\""
puts dms(93.034773) == "93°02'05\""
puts dms(0) == "0°00'00\""
puts dms(360) == "360°00'00\"" || dms(360) == "0°00'00\""
