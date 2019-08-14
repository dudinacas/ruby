def cheese_and_crackers(cheese_count, boxes_of_crackers) # the method cheese_and_crackers takes the variables cheese_count and boxes_of_crackers as variables
	puts "You have #{cheese_count} cheeses!"
	puts "You have #{boxes_of_crackers} boxes of crackers!"
	puts "Man, that's enough for a party!"
	puts "Get a blanket.\n"
end


puts "We can just give the function numbers directly:"
cheese_and_crackers(20,30) # gives the arguments directly to the method


puts "OR, we can use variables from our script:"
amount_of_cheese = 10
amount_of_crackers = 50

cheese_and_crackers(amount_of_cheese, amount_of_crackers) # uses set variables as argument in the method


puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6) # sets arguments to 10+20 (30) and 5+6 (11)


puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000) # adds 100 to the amount of cheese variable, adds 1000 to the amount of crackers variable, and uses these numbers as arguments.
