# this one is like your scripts with ARGV
def print_two(*args) # block of code that takes an infinite amount arguments
	arg1, arg2 = args # dictates the code requires 2 arguments, makes first 2 arguments given arg1 and arg2
	puts "arg1: #{arg1}, arg2: #{arg2}" # prints 2 arguments
end

# ok, that *args is actually pointless, we can just do this
def print_two_again(arg1, arg2) # does same thing as print_two but makes more sense
	puts "arg1: #{arg1}, arg2: #{arg2}" # same as line 3
end

# this just takes one argument
def print_one(arg1) # asks for 1 variable this time
	puts "arg1: #{arg1}" # prints that 1 variable
end

# this one takes no arguments
def print_none()
	puts "I got nothin'."
end


print_two("Zed","Shaw")
print_two_again("Zed","Shaw")
print_one("First!")
print_none()
