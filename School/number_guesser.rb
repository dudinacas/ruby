guess = 0
p1_guess = 0
p2_guess = 0
p1_count = 0
p2_count = 0
secret = Random.rand(1...101)
puts "I've picked a random number between 1 and 100."

while true
  print "PLAYER 1: Take a guess.\n>"
  guess = $stdin.gets.to_i
  p1_guess = guess

  p1_count += 1
  if guess > secret
    puts "Too high!"
  elsif guess < secret
    puts "Too low!"
  elsif guess == secret
    puts "You got it!"
    break
  end

  print "PLAYER 2: Take a guess.\n>"
  guess = $stdin.gets.to_i
  p2_guess = guess

  p2_count += 1
  if guess > secret
    puts "Too high!"
  elsif guess < secret
    puts "Too low!"
  elsif guess == secret
    puts "You got it!"
    break
  end

end

if p2_guess == secret
  puts "Player 2 wins, with #{p2_count} guesses!"
elsif p1_guess == secret
  puts "Player 1 wins, with #{p1_count} guesses!"
end

# TODO: remove hardcoding and allow for infinite players
