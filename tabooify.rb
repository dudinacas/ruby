puts "Insert text to TABOOIFY | TA13OO1FY"
puts "(End input with a tab)"
print ">"

input = $stdin.gets("\t\n").chomp.strip.upcase

taboo = {
  "B" => "13",
  "I" => "1",
  "S" => "Z"
}

tabooified = input + " | " + input.gsub!(/[BIS]/, taboo)
puts tabooified
