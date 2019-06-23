# Pizza ordering service
# Copyright (C) 2019 Zachary Picone
# This software is released through the GNU Affero General Public License, version 3. For more information, see the LICENSE file.

require_relative './lib/ordering.rb'
require_relative './lib/verification.rb'
require_relative './lib/formatting.rb'
include Ordering
include Verification
include Formatting

# to add another pizza, use this format: ["name of pizza", price of pizza]
pizza_list = [
  ["Meatlovers", 8.5], ["Hawaiian", 8.5], ["Cheese", 8.5], ["Cheesy Garlic", 8.5], ["Pepperoni", 8.5], ["Supreme", 8.5], ["Vegetarian", 8.5], ["Italian Sausage", 8.5], ["Butter Chicken", 13.5], ["Garlic Prawn", 13.5], ["Sweet & Sour Pork", 13.5], ["Seaweed & Anchovy", 13.5], ["Jalapeno Chicken", 13.5], ["Grape 'n Gravy", 13.5], ["Artesian Water", 13.5], ["Flaming-Hot Pipes Special", 15]
]
delivery_charge = 3.0

puts "Welcome to Bruce's Piping-Hot Pizza!\n\n" # \n = newline
valid = true

while true # loop to restart program if order is cancelled

  while valid == true # infinite loop of pizza ordering program, quit by break command

    puts "How many pizzas are being ordered [1-5]?"
    count = Verification.validateItemCount(5) # makes sure given is below 6
    pizza_count = count[0]

    if count[1] == 0 # cancels order if 0 pizzas ordered
      break
    end

    Ordering.buildOrderList(pizza_list) # generates list of all pizzas

    pizza_chosen = Ordering.pickOrder(pizza_list, pizza_count) # creates an order. output = ordered items, total price, items ordered plus prices

    if pizza_chosen == false # cancels order if cancel option is selected
      break
    end

    print "\nThe pizzas being ordered are "
    pizza_chosen[0].each do |i|
      print "#{i[0]}, " # in the pizza_chosen[0] array, i[1] is the price of the item while i[0] is the name
    end
    puts "and this will cost #{Formatting.floatToCurrency(pizza_chosen[1])} in total.\n\n"

    customer_info = Ordering.orderTransport(delivery_charge) # gets info on delivery type
    if customer_info == false # cancels order if cancel option is selected
      break
    end

    if customer_info[0] == "delivery"
      full_info = true # shows address and phone number, if pickup omits these items in outputOrder
    elsif customer_info[0] == "pickup"
      full_info = false
    end

    Ordering.outputOrder(full_info, pizza_chosen, customer_info)

    break # goes to input another order section

  end

  valid = false

  puts "\nInput another order? [y/n]"
  print ">"
  input = $stdin.gets.chomp.downcase.strip # so that Y and N work

  if input != "y" and input != "n"
    puts "Invalid syntax."
  elsif input == "n"
    puts "Quitting program..."
    exit
  else
    puts "Creating another order...\n\n" # as this is in a loop, goes back to input another order if valid is set true
    valid = true
  end

end
