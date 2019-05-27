ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "Wait, there are not 10 things in that list. Let's fix that."

stuff = ten_things.split(' ') # splits items in variable based on space delineating them, turning into array
more_stuff = ["Day", "Night", "Song", "Frisbee", "Corn", "Banana", "Girl", "Boy"] # array with more stuff in it

# using math to make sure there's 10 items

while stuff.length != 10 # is not 10
  next_one = more_stuff.pop # removes last element from more_stuff and adds it to next_one variable
  puts "Adding: #{next_one}"
  stuff.push(next_one) # pushes onto end of array
  puts "There are #{stuff.length} items now."
end

puts "There we go: #{stuff}"

puts "Let's do some things with stuff."

puts stuff[1] # array starts from 0 so takes second item
puts stuff[-1] # takes last item in array
puts stuff.pop() # pops last item in array off, removing it
puts stuff.join(' ') # prints it with space as delineation
puts stuff[3..5].join("#") # items 4-6 are joined with pound signs
