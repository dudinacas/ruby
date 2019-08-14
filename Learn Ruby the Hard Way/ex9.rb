days = "Mon Tue Wed Thu Fri Sat Sun" #Prints the days in 1 string, no spacers
months = "\nJan\nFeb\nMar\nMay\nJun\nJul\nAug" #Prints the months seperated by lines, shown by the \n value

puts "Here are the days: #{days}" #prints days variable
puts "Here are the months: #{months}" #prints months variable

puts %q{
There's something going on here.
With this weird quote
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
} #multiline quote thanks to %q{ parameter
