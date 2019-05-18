# this is really bad code, i gave up

def start
    puts "Welcome to Pogger's Peril!"
    puts "Before we start on this quest, I need to know your name."

    puts "What be your name, adventurer?"
    print ">"
    name = $stdin.gets.chomp

    puts "You are now entering the world of Pogger's Peril, #{name}! Buckle your seatbelt..."
    sleep(3)
    system "clear" or system "cls"
    starting_room
end

def starting_room
    puts "You wake up in a dark room, made of stone. You are completely naked. The door seems to be locked. There is a set of tattered clothes on the floor, and a small grate to your right."

    while true
        puts "What do you do?"
        print ">"
        choice = $stdin.gets.chomp
        clothes_on = false
        grate_open = false
        key_taken = false
        door_open = false

        if choice == "open door" && !key_taken
            puts "It's locked."
        elsif choice == "wear clothes" && !clothes_on
            if clothes_on == false
                puts "You put on the clothes. You feel a lot less exposed."
                clothes_on = !clothes_on
            else
                puts "You're already wearing the clothes."
            end
        elsif choice == "open grate" && !grate_open
            puts "The grate slides open, making a harsh noise. You can see a shiny key inside the small alcove behind the grate."
            grate_open = !grate_open
        elsif choice == "close grate" && grate_open
            puts "The grate slides shut with a bang."
            grate_open = !grate_open
        elsif choice == "grate" && grate_open
            dead("Your frustration with the grate causes you to stick your neck into the alcove. The grate suddenly slams shut, revealing the guillotine-like nature of the apparatus to your neck.")
        elsif choice == "take key" && grate_open && !key_taken
            puts "You take the key. This might be useful for the door."
            key_taken = !key_taken
        elsif choice == "use key on door" && key_taken && !clothes_on
            dead("You unlock the door with the key. It swings open suddenly, exposing your naked body to the guard in front of you. As he doesn't want to be seen as gay, he doesn't hesitate in stabbing you.")
        elsif choice == "use key on door" && key_taken && clothes_on
            puts "You open the door, revealing an empty hallway."
            puts "You step out into the hallway..."
        else
            puts "Sorry, I don't quite understand you."
        end
    end

end

def dead(why)
    puts why
    puts "You have died. Try again?"
    exit(0)
end

start
