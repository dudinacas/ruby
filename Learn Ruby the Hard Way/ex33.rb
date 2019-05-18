def counter(max, increment)
    i = 0
    numbers = []

    while i < max
        puts "At the top i is #{i}"
        numbers.push(i)

        i += increment
        puts "Numbers now: ", numbers
        puts "At the bottom i is #{i}"
    end

    puts "The numbers: "

    # remember you can write this 2 other ways
    numbers.each {|num| puts num }
end

puts "What is the maximum number? "
maxip = $stdin.gets.chomp.to_i

puts "What number would you like to increment by? "
incip = $stdin.gets.chomp.to_i

counter(maxip, incip)
