print "How old are you? " # Space after print command, prompting for answer
age = gets.chomp # gets prompts for answer, storing the answer in the {age} variable. chomp is a method that removes the \n from the answer
print "How tall are you? "
height = gets.chomp
print "How much do you weigh? "
weight = gets.chomp

puts "So, you're #{age} old, #{height} tall and #{weight} heavy." # prints all answers given
