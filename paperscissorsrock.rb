# simple paper scissors rock game against cpu

@hands = ['paper', 'rock', 'scissors']
@winning_hands = ['scissorspaper', 'paperrock', 'rockscissors']
@player_score = 0
@cpu_score = 0

def game(player_hand)
  if !@hands.include?(player_hand)
    puts "Invalid move.\n\n"
  else
    ai_hand = @hands.sample # picks random hand for ai
    if @winning_hands.include?(player_hand + ai_hand) # checks if your hand has won
      puts "\n#{player_hand.capitalize} beats #{ai_hand}!"
      puts "Player wins!"
      @player_score += 1
    elsif ai_hand == player_hand
      puts "\n#{player_hand.capitalize} draws with #{ai_hand}!"
      puts "Nobody wins!"
    else
      puts "\n#{ai_hand.capitalize} beats #{player_hand}!"
      puts "CPU wins!"
      @cpu_score += 1
    end
  end
end

def score_count
  puts "\nPlayer score: #{@player_score}"
  puts "CPU score: #{@cpu_score}"
  if @cpu_score > @player_score
    puts "CPU is winning!"
  elsif @player_score > @cpu_score
    puts "Player is winning!"
  else
    puts "Player and CPU are tied!"
  end
  puts ""
end

# Game loop starts here

while true do
  puts "Paper, scissors, or rock?"
  print ">"
  decision = $stdin.gets.chomp
  decision = decision.strip.downcase
  game(decision)
  if @player_score == 5
    puts "\nPlayer is victorious!"
    puts "Player's score: #{@player_score}. CPU's score: #{@cpu_score}"
    break
  elsif @cpu_score == 5
    puts "\nCPU is victorious!"
    puts "CPU's score: #{@cpu_score}. Player's score: #{@player_score}"
    break
  else
    score_count
  end
end
