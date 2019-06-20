module Ordering

  def build_order_list(list)
    list.each_index do |i|
      puts "#{i+1}: #{list[i][0]} - $#{list[i][1]}"
      @final = i+1
    end
    puts "#{@final+1}: Cancel ordering"
  end

  def order_transport
    valid = false
    puts "Would you like to pickup or takeaway? [pickup / takeaway / cancel]"
    until valid == true
      print ">"
      input = $stdin.gets.chomp
      if input == "pickup"
        puts "pickup"
        valid = true
      elsif input == "takeaway"
        puts "takeaway"
        valid = true
      elsif input == "cancel"
        puts "Order cancelled."
        break
      else
        puts "Invalid input."
      end
    end
  end

end
