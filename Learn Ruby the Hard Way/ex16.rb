filename = ARGV.first #makes first cmd argument given the filename of the document edited

puts "We're going to erase #{filename}" #uses name of file
puts "If you don't want that, hit CTRL-C (^C)." #^C ends program
puts "If you do want that, hit RETURN."

$stdin.gets #you can actually press most keys here to continue

puts "Opening the file..."
target = open(filename, 'w') # opens file, w = write-only aka wipes file beforehand

puts "Truncating the file. Goodbye!"
target.truncate(0) # erases (truncates) file to 0 characters length. not actually required due to the 'w' argument given

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp # takes input, moves to line1 variable
print "line 2: "
line2 = $stdin.gets.chomp # takes input, moves to line2 variable
print "line 3: "
line3 = $stdin.gets.chomp # takes input, moves to line3 variable

puts "I'm going to write these to the file."

target.write(line1) # writes line1 variable to document
target.write("\n") # creates new line
target.write(line2) # writes line2 variable to next line
target.write("\n")
target.write(line3)
target.write("\n") # creates new line after for some reason
#target.write(line1, "\n", line2, "\n", line3, "\n") # the same thing except all on 1 line

puts "And finally, we close it."
target.close # closes document
