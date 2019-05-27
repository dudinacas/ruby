formatter = "%{first} %{second} %{third} %{fourth}" #variable that formats whatever is given for values first, second, third, and fourth

puts formatter % {first: 1, second: 2, third: 3, fourth: 4} #values 1,2,3,4 used for variable
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"} #string values one, two, three, and four used for variable
puts formatter % {first: true, second: false, third: true, fourth: false} #boolean values true and false used for variable
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter} #recursively loops variable as value

puts formatter % {
	first: "I had this thing.", #open brackets into multiple lines. each line is one part of the variable.
	second: "That you could type up right.",
	third: "But it didn't sing.",
	fourth: "So I said goodnight."
}
