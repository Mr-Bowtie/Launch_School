# input : a positve or negative integer
# output : the time of day in 24 hour format (hh:mm)
# if the input is negative the time is before midnight, if it is positive, it is after midnight
# an extra 0 needs to be added if the minutes are single digits
# it needs to be in string format, the output
# given an input in minutes, determine the number of hours and minutes either before or after midnight
# return a string representation of the time. the hour and minutes will be integers interpolated into a string.
#Algorithm:
#   determine if the number is positive or negative.
#   while input > 1440
#     input -= 1440
#   end
#   if negative
#     hours = 23 - (input / 60)
#     minutes = 60 - (input % 60)

DAY_MINUTES = 1440

def time_of_day(time)
  abs_time = (time.negative? ? -time : time)
  abs_time -= 1440 while abs_time > 1440
  if time.negative?
    hours = (23 - (abs_time / 60))
    minutes = (60 - (abs_time % 60))
  else
    hours = (abs_time / 60)
    minutes = (abs_time % 60)
  end
  hours < 10 ? hours = hours.to_s.prepend('0') : hours = hours.to_s
  minutes < 10 ? minutes = minutes.to_s.prepend('0') : minutes = minutes.to_s
  puts hours + ':' + minutes
end

time_of_day(0)
time_of_day(-3)
time_of_day(35)
time_of_day(-1437)
time_of_day(3000)
time_of_day(800)
time_of_day(-4231)

# ... LS is so much shorter, of course. Need to store hours and minutes and such as constants, so everything is
# labeled and there isnt a bunch of random numbers that might not make sense to someone else.
# the format method makes life much easier.

#LS solution
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
