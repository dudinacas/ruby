# before continuing with ex42, make sure I can understand this

require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {
  "class ### < ###\nend" =>
    "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
    "class ### has-a initalize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
    "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
    "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
    "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
    "From *** get the *** attribute and set it to '***'."
  }

PHRASE_FIRST = ARGV[0] == "english" # if first terminal argument is english, set PHRASE_FIRST to english

open(WORD_URL) {|f|
  f.each_line {|word| WORDS.push(word.chomp)} # for each line of the txt file, put each word into the WORDS array
  }

def craft_names(rand_words, snippet, pattern, caps=false)
  names = snippet.scan(pattern).map do # scan looks for a certain pattern and makes into array, map returns new array called 'names'
    word = rand_words.pop()
    caps ? word.capitalize : word # if caps = true word is capitalised
  end

  return names * 2 # duplicates every name?
end

def craft_params(rand_words, snippet, pattern) # creates parameters for code
  names = (0...snippet.scan(pattern).length).map do
    param_count = rand(3) +  1 # number of params from 0 to 2, adds 1
    params = (0...param_count).map {|x| rand_words.pop() }
    params.join(', ')
  end

  return names * 2
end

def convert(snippet, phrase)
  rand_words = WORDS.sort_by {rand}
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|
    # fake class names, also copies sentence
    result = sentence.gsub(/###/) {|x| class_names.pop }

    # fake other names
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

    # fake parameter lists
    result.gsub!(/@@@/) {|x| param_names.pop }

    results.push(result)
  end

  return results
end

# keep going until they hit ^D
loop do
  snippets = PHRASES.keys().sort_by {rand}

  for snippet in snippets
    phrase = PHRASES[snippet]
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      question, answer = answer, question
    end

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER: %s\n\n" % answer
  end
end
