sports = ['football', 'basketball', 'rugby', 'hockey']
sports_teams = [11, 5, 15, 11]

def calculate(team, count, sport)
  team_num = count / team
  reserves = count % team
  return team_num, reserves
end

puts "Which sport would you like to calculate? [football/rugby/basketball/hockey]"

response = false
while response == false do
  print ">"
  ans = $stdin.gets.chomp
  if sports.include?(ans)
    response = true
    sports_num = sports.index(ans)
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

data = calculate(sports_teams[sports_num], num, ans)
puts "There can be #{data[0]} #{sports[sports_num]} team(s), and #{data[1]} player(s) will be left over."
