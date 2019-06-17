cash_array = [100, 50, 20, 10, 5, 2, 1, 0.5, 0.2, 0.1]

print "How much was the price of the dinner?\n>"
price = $stdin.gets.to_f

print "What amount of money did you give the cashier?\n>"
money = $stdin.gets.to_f

change = money - price
leftover_change = change

puts "You'll get $#{change.round(2)} change, made out of: "
cash_array.each do |i|
  print "#{(leftover_change / i).to_i} $#{i}, "
  leftover_change = leftover_change - (i * (leftover_change / i).to_i)
end
