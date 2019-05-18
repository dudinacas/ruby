array1 = Array.new
(1..100).each do |x| # Counts from 1 to 100, adds each iteration to array1. Here maybe randomise and sort this array?
    array1 << x
end

puts array1

counter = 0
even = Array.new

while counter < array1.length # until the end of array 1
    if array1[counter] % 2 == 0 # if remainder of 2 is 0 (eg. even number)
        counter = array1[counter] # set counter value to number at counter's number
        even << counter # add even number to even
    end
    counter += 1 # increments counter
end

puts even
