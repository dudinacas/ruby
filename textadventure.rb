# Simple text adventure to help me learn Ruby.
# (c) Zachary Picone, 2019
# Released under the WTFPL

# require 'colorize'

module Adventure # module for all text adventure commands

    def Adventure.location(loc, loc2)
        puts loc
        puts loc2 # .red
    end

    def Adventure.inventory(inv) # prints your inventory array
        if inv.length <= 0
            puts "Your inventory is empty."
        else
            print "Your inventory includes #{inv}"
            puts ""
        end
    end

    def Adventure.take(query, var, inv)
        puts var
        puts "You take #{query}"
        inv.push(query)
        var = "nil"
    end


    # TODO: Def look, def use, def open, etc.

end

def start
    puts "Welcome to this adventure! Before we start, I need to know your name."
    puts "What be your name, adventurer?"
    print ">"
    name = $stdin.gets.chomp
    puts "Welcome, #{name}! Your adventure starts now!" # .blue
    intro
end

def intro
    inventory = Array.new
    location = "You wake up in an unfamiliar forest. There seems to be an impenetrable wall of trees in front of you. To your west is a dirt path leading to a clearing. To your east seems to be the same dirt path, leading into the distance."
    location2 = "Further inspection seems to reveal a shiny object in the grass beside you."
    key = "The shiny object seems to be a key. This might be useful."
    puts location

    while true do
        puts "What do you do?"
        print ">"
        input = $stdin.gets.chomp
        decisionArray = input.split
        if decisionArray.length >= 3 then
            puts "Sorry, your sentence is too long for me to understand."
        elsif decisionArray.first == "take"
            if eval(decisionArray.last).to_s == "nil" # TODO: different confirmation and we good, just merge this with the method... set nil, find boolean?
                puts "I can't see a #{decisionArray.last} anywhere."
            else
                Adventure.take(decisionArray.last, eval(decisionArray.last), inventory)
            end
        elsif decisionArray.first == "inventory"
            Adventure.inventory(inventory)
        elsif decisionArray.first == "look"
            Adventure.location(location, location2)
        else
            puts "I'm not sure what you mean by '#{decisionArray.first}'"
        end
    end
end

start
