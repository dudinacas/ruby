require 'colorize'

puts "What time is your plane departing? Format: [HHMM]"
time = $stdin.gets.to_i

puts "How long is your flight in minutes?"
duration = $stdin.gets.to_i

dur_hours = duration / 60
dur_minutes = duration % 60

final_time = (time + (dur_hours * 100) + dur_minutes)

# checks if the final time is greater than 23:59
days_later = (final_time / 2400)
final_time = final_time - (2400 * days_later)

final_time_s = final_time.to_s

# formatting final time string...
if final_time_s.length < 4
  final_time_s = ('0' * (4 - final_time_s.length)) + final_time_s
end
final_time_s = final_time_s.insert(2, ':').blue

if days_later > 0
  puts "Your flight will arrive at #{final_time_s}, #{days_later} day(s) later."
else
  puts "Your flight will arrive at #{final_time_s}."
end
