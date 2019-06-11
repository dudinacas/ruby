def calculate(team, count, sport)
  team_num = count / team
  reserves = count % team
  puts "There can be #{team_num} #{sport} teams, and #{reserves} players left over."
end

puts "Which sport would you like to calculate? [football/rugby/basketball/hockey]"

response = false
while response == false do
  print ">"
  ans = $stdin.gets.chomp
  if ans == "football" # change to arrays
    response = true
  elsif ans == "rugby"
    response = true
  elsif ans == "basketball"
    response = true
  elsif ans == "hockey"
    response = true
  else
    puts "Invalid input."
  end
end

puts "How many players want to play #{ans}?"

response = false
while response == false do
  print ">"
  num = $stdin.gets.chomp
  num = num.to_i
  if num > 0
    response = true
  else
    puts "Invalid input."
  end
end

case
when "football"
  calculate(14, num, "football")
when "rugby"
  calculate(22, num, "rugby")
when "basketball"
  calculate(9, num, "basketball")
when "hockey"
  calculate(11, num, "hockey")
end
