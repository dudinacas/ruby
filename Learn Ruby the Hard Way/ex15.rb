filename = ARGV.first # sets argument used as filename variable

txt = open(filename) # loads file in variable filename into code as variable 'txt'

puts "Here's your file #{filename}:"
print txt.read # prints file currently in 'txt'

print "Type the filename again: "
file_again = $stdin.gets.chomp # sets filename prompt as variable 'file_again'

txt_again = open(file_again) # loads file in variable file_again into code as variable 'txt_again'

