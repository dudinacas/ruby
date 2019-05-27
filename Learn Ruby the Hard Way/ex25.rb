module Ex25

	# This function will break up words for us.
	def Ex25.break_words(stuff)
		words = stuff.split(' ') # splits the string into substring array of each individual word
		return words # explicitly returns this value
	end
	
	# Sorts the words.
	def Ex25.sort_words(words)
		return words.sort # sorts thearray into an array of each word sorted alphabetically
	end
	
	# Prints the first word after shifting it off.
	def Ex25.print_first_word(words)
		word = words.shift # removes the first element of an array and returns it,
		puts word
	end
	
	# Prints the last word after popping it off.
	def Ex25.print_last_word(words)
		word = words.pop # removes the last element from self and returns it
		puts word
	end
	
	# Takes in a full sentence and returns the sorted words.
	def Ex25.sort_sentence(sentence)
		words = Ex25.break_words(sentence) # breaks string into array and sends to variable words
		return Ex25.sort_words(words) # returns array sorted in alphabetical order
	end
	
	# Prints the first and last words of the sentence.
	def Ex25.print_first_and_last(sentence)
		words = Ex25.break_words(sentence) # breaks string into array
		Ex25.print_first_word(words) # prints first word of sentence alphabetically
		Ex25.print_last_word(words) # prints last word of sentence alphabetically
	end

	# Sorts the word, Prints the first and last words of the sentence.
	def Ex25.print_first_and_last_sorted(sentence)
		words = Ex25.sort_sentence(sentence) # takes sorted sentence, puts in variable words
		Ex25.print_first_word(words) # prints first word of sentence alphabetically
		Ex25.print_last_word(words) # prints last word of sentence alphabetically
	end
	
end
