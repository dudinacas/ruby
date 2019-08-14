from_file, to_file = ARGV # command line arguments for the variables from_file and to_file

puts "Copying from #{from_file} to #{to_file}" # pretty self-explanatory

#we could do these two on one line, how?
in_file = open(from_file) # opens from_file and sends into in_file variable
indata = in_file.read # parses in_file and puts data into indata

puts "The input file is #{indata.length} bytes long" # indata.length counts the amount of characters in indata

puts "Does the output file exist? #{File.exist?(to_file)}" # checks if to_file exists already, gives true or false booleanmore
puts "Ready, hit RETURN to continue, CTRL-C to abort."
$stdin.gets # waits for input from user

out_file = open(to_file, 'w') # sets to_file to write mode, sends it to out_file variable
out_file.write(indata) # writes the indata variable to out_file

puts "Alright, all done."

out_file.close
in_file.close # closes variables and the files from_file and to_file
