# Pizza ordering service, ordering module
# Copyright (C) 2019 Zachary Picone
# This software is released through the GNU Affero General Public License, version 3. For more information, see the LICENSE file.

module Ordering

  require_relative './verification.rb'
  require_relative './formatting.rb'
  include Verification
  include Formatting

  def buildOrderList(list)
    puts "" # newline
    list.each_index do |i| # for the index (position) of each item in list
      puts "#{i+1}: #{list[i][0]} - #{Formatting.floatToCurrency(list[i][1])}" # item 0/1 in item [i] of list
      @number = i+1
    end
    puts "#{@number+1}: Cancel ordering"
  end

  def pickOrder(list, count)
    ordered_items = Array.new
    item_table = Array.new
    total_price = 0

    count.times do |i| # for every pizza wanted repeat this section
      if ordered_items.length > 0 # print statement if items have already been ordered
        puts "The current pizza(s) you have ordered are #{ordered_items}. You have #{count - ordered_items.length} pizza(s) left to order."
      end
      selection_complete = false
      until selection_complete == true
        puts "Select a pizza:"
        print ">"
        selection = $stdin.gets.to_i
        if selection == (list.length + 1) # number after last pizza, eg. cancel order
          puts "Order cancelled."
          return false
          break
        elsif list.fetch(selection - 1, "fail") == "fail" # if number is negative or invalid
          puts "Invalid number."
        elsif selection > 0 # if this is not checked, program will take the last item in array upon no number entered
          requested_item = list[selection-1]
          puts "You have selected #{requested_item[0]} at a price of #{Formatting.floatToCurrency(requested_item[1])}."
          puts "Are you sure you want to order this pizza? [y/n]"
          print ">"
          selection = $stdin.gets.chomp.downcase
          if selection == "y"
            selection_complete = true
          elsif selection == "n"
            puts "Pizza not ordered."
          else
            puts "Invalid response. Pizza not ordered." # so they are absolutely certain they want x pizza
          end
        else
          puts "Invalid number."
        end
      end
      ordered_items << requested_item[0] # this could be removed, and code that uses it replaced with item_table
      total_price = total_price + requested_item[1]
      item_table << requested_item
    end
    return ordered_items, total_price, item_table
  end

  def orderTransport(surcharge)
    customer_info = Array.new
    valid = false
    valid_num = false
    puts "Is it pickup or delivery? [pickup / delivery / cancel]"
    until valid == true
      print ">"
      input = $stdin.gets.chomp.downcase
      if input == "pickup"
        puts "What is the customer's name?"
        print ">"
        customer_info << $stdin.gets.chomp # appends customer name to customer_info array
        valid = true
      elsif input == "delivery"
        puts "What is the customer's name?"
        print ">"
        customer_info << $stdin.gets.chomp
        puts "What is the customer's address?"
        print ">"
        customer_info << $stdin.gets.chomp
        puts "What is the customer's phone number?"
        customer_info << Verification.validatePhoneNumber # verifies phone number is possible
        puts "A #{Formatting.floatToCurrency(surcharge)} delivery charge will be added to the customer's order."
        customer_info << surcharge # change this if surcharge is changed
        valid = true
      elsif input == "cancel"
        puts "Order cancelled."
        return false # reports false instead of array
        break
      else
        puts "Invalid input."
      end
    end
    return input, customer_info
  end

end
