def add(a, b)
	puts "ADDING #{a} + #{b}" # says the numbers being added
	return a + b # adds a and b together. return is not needed but is clearer for these purposes
end

def subtract(a, b)
	puts "SUBTRACTING #{a} - #{b}"
	return a - b
end

def multiply(a, b)
	puts "MULTIPLYING #{a} * #{b}"
	return a * b
end

def divide(a, b)
	puts "DIVIDING #{a} / #{b}"
	return a / b
end


puts "Let's do some math with just functions!"

age = add(30, 5) # uses the add function to combine numbers 30 and 5
height = subtract(78, 4)
weight = multiply(90, 2)
iq = divide(100, 2)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"


# A puzzle for the extra credit, type it in anyway.
puts "Here is a puzzle."

what = add(age, subtract(height, multiply(weight, divide(iq, 2)))) # divides iq by 2, multiplies by weight, subtracts height by that answer, and adds age

puts "That becomes: #{what}. Can you do it by hand?" # yes
