def add(arg1, arg2)
	puts "Adding #{arg1} + #{arg2}..."
	return arg1 + arg2
end

puts "What number would you like to start with?"
num1 = Float($stdin.gets.chomp)

while 2>1
	puts "What number would you like to add to #{num1}?"
	num2 = Float($stdin.gets.chomp)

	answer = add(num1, num2)
	puts "#{num1} + #{num2} = #{answer}."

	puts "If you would like to add another number to your answer, press enter. If you would like to quit, press ctrl-c."
	$stdin.gets.chomp

	num1 = answer
	puts "Your number is currently #{num1}."
end
