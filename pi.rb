puts 'How many digits of pi would you like to calculate?'
print '>'

digits = $stdin.gets.to_i

i = -1.0
π = 0.0
x = 0
until x > (10000*digits) do
  i = i+2
  π = π + (4/i)
  i = i+2
  π = π - (4/i)
  x += 1
end

print “%(digits)f” % π # not working idk why
