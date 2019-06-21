# Pizza ordering service, verification module
# Copyright (C) 2019 Zachary Picone
# This software is released through the GNU Affero General Public License, version 3. For more information, see the LICENSE file.

module Verification

  def validatePhoneNumber
    valid = false
    until valid == true
      print ">"
      input = $stdin.gets.to_s.delete('^0-9') # checks if phone number valid, converts to string, deletes any non-numeric characters
      if input.length >= 7 and input.length <= 10
        valid = true
      else
        puts "Invalid number."
      end
    end
    return input
  end

  def validateItemCount(max)
    selection_complete = false
    until selection_complete == true
      print ">"
      selection = $stdin.gets.to_i
      if selection < 0
        puts "Invalid number."
      elsif selection > max # max amount of pizzas ordered
        puts "Too many pizzas."
      elsif selection >= 1
        count = selection
        puts "#{count} pizzas selected."
        selection_complete = true
      elsif selection == 0 # next block of code will cancel
        puts "Invalid number or order cancelled."
        break
      else
        puts "Invalid number."
      end
    end
    return count, selection
  end

end
