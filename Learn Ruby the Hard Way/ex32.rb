the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# this first kind of for-loop goes through a list
# in a more traditional style found in other languages
for number in the_count # for every single item in array 'the_count', named 'number'
    puts "This is count #{number}" # print that item as a variable
end

# same as above, but in a more Ruby style
# this and the next one are the preferred
# way Ruby for-loops are written
fruits.each do |fruit| # for every single item in array 'fruits', named 'fruit'
    puts "A fruit of type: #{fruit}" # print that item as a variable
end

# also we can go through mixed lists too
# note this is yet another style, exactly like above
# but a different syntax
change.each {|i| puts "I got #{i}"} # for every single item in array 'change', named 'i', print that item as a variable

# we can also build lists, first start with a empty one
elements = []

# then use the range operator to do 0 to 5 counts
(0..5).each do |i| # for each number 0 to 5, push to array i (adding as variable first)
    puts "adding #{i} to the list."
    # appends the i variable onto the *end* of the list
    elements.push(i)
end

# now we can print them out too
elements.each {|i| puts "Element was: #{i}" } # same method as line 21
