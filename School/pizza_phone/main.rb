# Pizza ordering service
# Copyright (C) 2019 Zachary Picone
# This software is released through the GNU Affero General Public License, version 3. For more information, see the LICENSE file.

require_relative './lib/ordering.rb'
include Ordering

# to add another pizza, use this format: ["name of pizza", price of pizza]
pizza_list = [
  ["Meatlovers", 8.5], ["Hawaiian", 8.5], ["Cheese", 8.5], ["Cheesy Garlic", 8.5], ["Pepperoni", 8.5], ["Supreme", 8.5], ["Vegetarian", 8.5], ["Butter Chicken", 13.5], ["Garlic Prawn", 13.5], ["Sweet & Sour Pork", 13.5], ["Seaweed & Anchovy", 13.5], ["Jalapeno Chicken", 13.5]
]

puts "Welcome to Bruce's Piping-Hot Pizza!\n\n"

while true # loop to restart program if order is cancelled

  while true # infinite loop, quit by break command

    puts "How many pizzas are being ordered?"
    selection_complete = false
    until selection_complete == true
      print ">"
      selection = $stdin.gets.to_i
      if selection < 0
        puts "Invalid number."
      elsif selection > 5
        puts "Too many pizzas."
      elsif selection >= 1
        pizza_count = selection
        puts "#{pizza_count} pizzas selected."
        selection_complete = true
      elsif selection == 0 # next block of code will cancel
        puts "Order cancelled."
      else
        puts "Invalid number."
      end
    end

    if selection == 0 # cancels order
      break
    end

    Ordering.buildOrderList(pizza_list) # generates list of all pizzas

    pizza_chosen = Ordering.pickOrder(pizza_list, pizza_count) # creates an order. output = ordered items, total price, items ordered plus prices
    if pizza_chosen == false
      break
    end

    # formatting information below this line

    print "\nThe pizzas being ordered are "
    pizza_chosen[0].each do |i|
      print "#{i}, "
    end
    puts "and this will cost $#{pizza_chosen[1]} in total.\n\n"

    customer_info = Ordering.orderTransport # gets info on delivery type

    if customer_info == false # cancels order if cancel option is selected
      break
    end

    if customer_info[0] == "delivery"
      full_info = true
    elsif customer_info[0] == "pickup"
      full_info = false
    end

    puts "\n#{customer_info[1][0]}'s order:"
    puts "Order type: #{customer_info[0].capitalize}" # capitalises "pickup" or "delivery" string

    if full_info == true
      total_price = pizza_chosen[1] + customer_info[1][3] # 3 dollar surcharge is stored in item [3] of nested array customer_info[1]
      puts "Customer Name: #{customer_info[1][0]}"
      puts "Customer Address: #{customer_info[1][1]}"
      puts "Customer Phone: #{customer_info[1][2]}"
      puts "Delivery Surcharge added: $#{customer_info[1][3]}"
    elsif full_info == false
      total_price = pizza_chosen[1]
      puts "\nCustomer Name: #{customer_info[1][0]}"
    end

    puts "Items ordered:"
    pizza_chosen[2].each_index do |i| # pizza_chosen[2] is the table of items ordered
      puts "#{pizza_chosen[2][i][0]} - $#{pizza_chosen[2][i][1]}"
    end

    puts "Total Price of Order: $#{total_price}"

  end

  puts "\nInput another order? [y/n]"
  print ">"
  input = $stdin.gets.chomp.downcase

  if input != "y" and input != "n"
    puts "Invalid syntax. Quitting program." # change later
    exit
  elsif input == "n"
    puts "Quitting program."
    exit
  else
    puts "Creating another order...\n\n"
  end

end

# TODO: number_to_currency() ?
# move more stuff to ordering.rb
