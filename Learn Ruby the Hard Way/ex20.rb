input_file = ARGV.first # sets command line argument to input_file

def print_all(f)
	puts f.read # prints the entirety of the 'f' document
end

def rewind(f)
	f.seek(0) # moves the 'f' document back to line 0 (start of the document)
end

def print_a_line(line_count, f)
	puts "#{line_count}, #{f.gets.chomp}" # prints the line given by line_count variable
end

current_file = open(input_file) # opens file given by cli argument and sets to variable current_file

puts "First let's print the whole file:\n"

print_all(current_file) # prints current_file variable

puts "Now let's rewind, kind of like a tape."

rewind(current_file) # moves current_file back to line 1

puts "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file) # prints the line given by variable current_line

current_line = current_line + 1 # adds 1 to current_line
print_a_line(current_line, current_file)

current_line = current_line + 1 # adds 1 to current_line
print_a_line(current_line, current_file)
