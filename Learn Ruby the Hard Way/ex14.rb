user_name = ARGV.first # gets first argument
prompt = '> ' # creates string to make prompt look like terminal input

puts "Hi #{user_name}." # prints first argument as username
puts "I'd like to ask you a few questions."
puts "Do you like me #{user_name}? "
print prompt # shows terminal input
likes = $stdin.gets.chomp # converts input into variable #{likes}

puts "Where do you live #{user_name}? "
print prompt
lives = $stdin.gets.chomp # same as likes variable

# a comma for puts is like using it twice
puts "What kind of computer do you have? ", prompt # prints string, prints terminal input
computer = $stdin.gets.chomp

puts """
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer. Nice.
""" # prints multi line statement using all variables given
