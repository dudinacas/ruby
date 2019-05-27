print "Give me a number: " # Asks for number.
number = gets.chomp.to_i # Stores in #{number} variable as a string with gets.chomp. to_i method changes the string into an integer.

bigger = number * 100 # Multiplies the number integer by 100
puts "A bigger number is #{bigger}."

print "Give me another number: " # Asks for number.
another = gets.chomp # Turns number into string with gets.chomp, stored in #{number} variable.
number = another.to_i # Converts #{another} to an integer with to_i, stores in #{number} variable.

smaller = number / 100
puts "A smaller number is #{smaller}."

# to_f converts integer/string into float variable
