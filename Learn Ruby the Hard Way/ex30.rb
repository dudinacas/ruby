people = 30
cars = 40
trucks = 15


if cars > people
    puts "We should take the cars."
elsif cars < people # if preceding if statement was not true, runs this code
    puts "We should not take the cars."
else # if none of the if/elsif statements were true, runs this code
    puts "We can't decide."
end

if trucks > cars
    puts "That's too many trucks."
elsif trucks < cars
    puts "Maybe we could take the trucks."
else
    puts "We still can't decide."
end

if people > trucks
    puts "Alright, let's just take the trucks."
else
    puts "Fine, let's stay home then."
end
