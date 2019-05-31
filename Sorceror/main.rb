# Sorceror - a mage combat game
# Created by Zachary Picone, released under the WTFPL

# this code is held together with glue and global variables

require 'colorize'
require_relative './lib/moves.rb'
include Moves

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
    puts "You should never see this text, contact the developer."
    Kernel.abort("Unhandled exception in #{__LINE__}")
  end

  print "\nStarting Sorceror"
  print "."; sleep(0.5)
  print "."; sleep(0.5)
  print ".\n\n"; sleep(0.5)
  system "clear" or system "cls"
  player_analysis
end

def player_analysis

  names = ['Harshvir', 'Oliver', 'Harry', 'Jack', 'George', 'Noah', 'Bruce', 'Charlie', 'Jacob', 'Alfie', 'Freddie', 'Oscar', 'Olivia', 'Amelia', 'Isla', 'Emily', 'Ava', 'Lily', 'Mia', 'Sophia', 'Isabella', 'Grace', 'Lisa Ann']
  types = ['Fire', 'Ice', 'Water']
  puts "Welcoming #{$player_name = names.sample.blue} to the arena!"; sleep(1)
  puts "Your health: #{$player_health}"; sleep(0.5)
  puts "Your mana: #{$player_mana}"; sleep(0.5)
  puts "Your magic type: #{$player_type = types.sample}"; sleep(0.5)
  puts "\nWelcoming #{$enemy_name = names.sample.red} to the arena!"; sleep(1)
  puts "Enemy's health: #{$enemy_health}"; sleep(0.5)
  puts "Enemy's mana: #{$enemy_mana}\n"; sleep(0.5)
  puts "Enemy's magic type: #{$enemy_type = types.sample}"; sleep(0.5)
  game_loop

end

def game_loop

  # Declare global variables here

  $ongoing_player_damage = [0, 0, 0, 0]
  $player_current_health = $player_health
  $enemy_current_health = $enemy_health
  $player_current_mana = $player_mana
  $enemy_current_mana = $enemy_mana
  $player_current_damage = $player_damage
  $enemy_current_damage = $enemy_damage

  while true do

    ## Pre-decision stuff goes here

    if $enemy_current_health <= 0
      puts "#{$enemy_name} has been fatally wounded!"
      puts "#{$player_name} wins!"
      break
    end

    # enemy's move will go here

    # player health check will go here

    if $ongoing_player_damage[0] >= 1
      Moves.std_attack($player_type, $ongoing_player_damage[1], $ongoing_player_damage[2], $ongoing_player_damage[3])
      $ongoing_player_damage[0] -= 1
      puts "Enemy is inflicted with #{Moves.indicate_damage} damage"
    end

    # Pre-decision stuff ends here

    puts "\nYour current health: #{$player_current_health}/#{$player_health}" # need to move this block into moves.decision or smth or shit be messed up
    puts "Your current mana: #{$player_current_mana}/#{$player_mana}"
    puts "#{$enemy_name}'s current health: #{$enemy_current_health}/#{$enemy_health}"
    puts "#{$enemy_name}'s current mana: #{$enemy_current_mana}/#{$enemy_mana}"
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

    Moves.choose(decision)

  end
end

init_game
