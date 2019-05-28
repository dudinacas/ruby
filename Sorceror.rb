# Sorceror - a mage combat game
# Created by Zachary Picone, released under the WTFPL

require 'colorize'

# TODO: Split program into multiple files

def set_vars(ratio)
  $player_health = (80 / ratio).to_i
  $enemy_health = (100 * (ratio * 0.95)).to_i
  $player_damage = (90 / ratio).to_i
  $enemy_damage = (90 * ratio).to_i
  $player_mana = (100 / ratio).to_i
  $enemy_mana = (100 * ratio).to_i
end

def init_game
  print "Welcome to "
  puts "Sorceror!".blue

  puts "Choose your difficulty [1-5]"

  response = false
  while response == false do
    print ">"
    ans = $stdin.gets.chomp
    ans = ans.to_i
    if !ans.between?(1,5)
      puts "Please input a valid difficulty."
    else
      puts "Difficulty: #{ans}"
      response = true
    end
  end

  case ans
  when 1
    set_vars(0.6)
  when 2
    set_vars(0.8)
  when 3
    set_vars(1.0)
  when 4
    set_vars(1.2)
  when 5
    set_vars(1.4)
  else
    "You should never see this text, contact the developer."
    Kernel.abort("Unhandled exception in #{__LINE__}")
  end

  print "Starting Sorceror"
  print "."; sleep(0.5)
  print "."; sleep(0.5)
  print ".\n\n"; sleep(0.5)
  player_analysis
end

def player_analysis

  names = ['Harshvir', 'Oliver', 'Harry', 'Jack', 'George', 'Noah', 'Bruce', 'Charlie', 'Jacob', 'Alfie', 'Freddie', 'Oscar', 'Olivia', 'Amelia', 'Isla', 'Emily', 'Ava', 'Lily', 'Mia', 'Sophia', 'Isabella', 'Grace', 'Lisa Ann']
  puts "Welcoming #{$player_name = names.sample.light_blue} to the arena!"; sleep(2)
  puts "Your health: #{$player_health}"; sleep(1)
  puts "Your mana: #{$player_mana}"; sleep(1)
  puts "\nWelcoming #{$enemy_name = names.sample.light_red} to the arena!"; sleep(2)
  puts "Enemy's health: #{$enemy_health}"; sleep(1)
  puts "Enemy's mana: #{$enemy_mana}\n"; sleep(1)
  game_loop

end

def game_loop

  player_current_health = $player_health
  enemy_current_health = $enemy_health
  player_current_mana = $player_mana
  enemy_current_mana = $enemy_mana
  player_current_damage = $player_damage
  enemy_current_damage = $enemy_damage

  while true do
    puts "\nYour current health: #{player_current_health}/#{$player_health}"
    puts "Your current mana: #{player_current_mana}/#{$player_mana}"
    puts "#{$enemy_name}'s current health: #{enemy_current_health}/#{$enemy_health}"
    puts "#{$enemy_name}'s current mana: #{enemy_current_mana}/#{$enemy_mana}"
    puts "\nWhat do you do?"
    puts "1. Damaging Spells / 2. Utility Spells / 3. Defensive Spells / 4. Recharge Mana / 5. Do nothing"
    print ">"
    decision = $stdin.gets.chomp
    decision = decision.to_i

    if !decision.between?(1,5)
      puts "Please input a valid number."
    else
      puts "\n"
    end

    case decision
    when 1
      puts "Dmg" # define function with attacks in each case
    when 2
      puts "Uti"
    when 3
      puts "Def"
    when 4
      puts "Rec"
    when 5
      puts "Don"
    else
    end
  end
end

init_game
