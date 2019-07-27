MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hour = time.split(":").shift.to_i
  return 0 if hour == 24
  minutes = time.split(":").pop.to_i
  (hour * MINUTES_PER_HOUR) + minutes
end

def before_midnight(time)
  unless after_midnight(time) == 0 
    MINUTES_PER_DAY - after_midnight(time)
  else
    0
  end 
end


puts after_midnight('00:00')
puts after_midnight('12:34')
puts after_midnight('24:00')
puts before_midnight('00:00')
puts before_midnight('12:34')
puts before_midnight('24:00')

# fairly close to the LS solution, similar thinking at least.

#LS solution

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i) #keep forgetting the multi-variable assignment
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY # accounts for both input of 24:00, clever
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end
