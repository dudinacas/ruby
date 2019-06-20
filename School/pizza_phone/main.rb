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

puts "How many pizzas would you like to order?"
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
  elsif selection == 0 # cancels order if 0 are chosen
    puts "Order cancelled."
    exit
  else
    puts "Invalid number."
  end
end

Ordering.build_order_list(pizza_list)

pizza_chosen = Ordering.pick_order(pizza_list, pizza_count)

print "\nThe pizzas you have ordered are "
pizza_chosen[0].each do |i|
  print "#{i}, "
end
puts "and this will cost you $#{pizza_chosen[1]} in total.\n\n"

customer_info = Ordering.order_transport
if customer_info[0] == "delivery"
  total_price = pizza_chosen[1] + customer_info[1][3] # 3 dollar surcharge is stored in item [3] of nested array customer_info[1]
  puts "\nCustomer Name: #{customer_info[1][0]}"
  puts "Customer Address: #{customer_info[1][1]}"
  puts "Customer Phone: #{customer_info[1][2]}"
  puts "Total Price of Order: #{total_price} (including delivery charge of $#{customer_info[1][3]})"
elsif customer_info[0] == "pickup"
  total_price = pizza_chosen[1]
  puts "\nCustomer Name: #{customer_info[1][0]}"
  puts "Total Price of Order: $#{total_price}"
end

puts "#{customer_info[1][0]}'s order:"
puts "#{customer_info[0].capitalize}"
puts "Items ordered:"
pizza_chosen[2].each_index do |i| # pizza_chosen[2] is the table of items ordered
  puts "#{pizza_chosen[2][i][0]} - $#{pizza_chosen[2][i][1]}"
end
