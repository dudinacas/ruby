guess = 0
guesses = 0
secret = Random.rand(1...101)
puts "I've picked a random number between 1 and 100."

until guess == secret
  print "Take a guess.\n>"
  guess = $stdin.gets.to_i

  if guess > secret
    puts "Too high!"
  elsif guess < secret
    puts "Too low!"
  elsif guess == secret
    puts "You got it!"
  end
  guesses += 1
end

END { puts "Thanks for playing!\nYou used #{guesses} guesse(s)." }
