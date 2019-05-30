# simple paper scissors rock game against cpu

@hands = ['paper', 'rock', 'scissors']
@player_score = 0
@cpu_score = 0

def game(player_hand)
  if !@hands.include?(player_hand)
    puts "Invalid move.\n\n"
  else
    ai_hand = @hands.sample
    if(ai_hand == 'paper' && player_hand == 'scissors') or (ai_hand == 'rock' && player_hand == 'paper') or (ai_hand == 'scissors' && player_hand == 'rock') # I know this is hardcoded, I'm a terrible person
      puts "#{player_hand.capitalize} beats #{ai_hand}!"
      puts "Player wins!"
      @player_score += 1
    elsif ai_hand == player_hand
      puts "#{player_hand.capitalize} draws with #{ai_hand}!"
      puts "Nobody wins!"
    else
      puts "#{ai_hand.capitalize} beats #{player_hand}!"
      puts "CPU wins!"
      @cpu_score += 1
    end
    score_count
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
end

