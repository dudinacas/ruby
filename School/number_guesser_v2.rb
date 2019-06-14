print "How many people would like to play?\n>"
people = $stdin.gets.to_i

secret = Random.rand(1...101)
puts "I've picked a random number between 1 and 100."

solved = false
count = 0

until solved == true
  people.times do |i|
    print "PLAYER #{i + 1}: Take a guess.\n>"
    guess = $stdin.gets.to_i

    count += 1
    if guess > secret
      puts "Too high!"
    elsif guess < secret
      puts "Too low!"
    elsif guess == secret
      puts "You got it!"
      puts "Player #{i + 1} wins, after #{count} total guesses."
      exit
    end
  end
end
