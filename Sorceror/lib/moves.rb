module Moves

  def decision
    while @turn_complete == 0
      puts "\nWhat do you do?"
      puts "1. Damaging Spells / 2. Utility Spells / 3. Defensive Spells / 4. Recharge Mana / 5. Do nothing"
      print ">"
      decision = $stdin.gets.chomp
      decision = decision.to_i

      if !decision.between?(1,5)
        puts "Please input a valid number."
      else
        puts "\n"
        Moves.choose(decision)
      end
    end
  end

  def choose(dec)
    case dec
    when 1
      Moves.attack # I know I don't need to declare the module but it's for clarity
    when 2
      puts "Uti"
      @turn_complete = 1
    when 3
      puts "Def"
      @turn_complete = 1
    when 4
      Moves.recover
      @turn_complete = 1
    when 5
      puts "You do nothing."
      @turn_complete = 1
    else
    end
  end

  def attack
    puts "What attacking move would you like to use?"
    # pokemon-style type weaknesses
    puts "1. #{$player_type} Ball     10 Base Damage      10 Mana"
    puts "2. #{$player_type} Storm    24 Base Damage      20 Mana"
    puts "3. Meteor        50 Base Damage      60 Mana"
    puts "4. Leech         10 Base Damage      15 Mana"
    puts "5. Wand Strike   4 Base Damage       0 Mana"
    puts "6. Cancel"
    # need to loop this
    print ">"
    move = $stdin.gets.chomp
    move = move.to_i
    puts ""
    case move
    when 1
      Moves.std_attack($player_type, " Ball", 10, 10)
    when 2
      $ongoing_player_damage = [2, " Storm", 12, 10] # turns, ability name, damage per round, mana per round
    when 3
      Moves.std_attack("", "Meteor", 50, 60)
    when 4
      Moves.std_attack("", "Leech", 10, 15)
      if $player_current_mana >= 15
        Moves.heal(5, 15)
      end
    when 5
      Moves.std_attack("", "Wand Strike", 4, 0)
    when 6
    else
      puts "Invalid move."
    end
  end

  def roll_crit
    crit = rand(1..100)
    if crit >= 95
      puts "Critical hit!"
      @crit_mult = 2
    elsif crit >= 90
      puts "Miss!"
      @crit_mult = 0
    else
      @crit_mult = 1
    end
  end

  def recover
    mana_recovery = rand(5..25)
    if $player_current_mana + mana_recovery > $player_mana
      player_recovered = $player_mana - $player_current_mana
      $player_current_mana = $player_mana
    else
      $player_current_mana += mana_recovery
      player_recovered = mana_recovery
    end
    puts "You recover #{player_recovered} MP"
    @turn_complete = 1
  end

  def heal(min, max)
    player_healing = (rand(min..max) * @crit_mult)
    if $player_current_health + player_healing > $player_health
      player_healed = $player_health - $player_current_health
      $player_current_health = $player_health
    else
      $player_current_mana += healing
      player_healed = player_healing
    end
    puts "You recover #{player_healed} HP"
    @turn_complete = 1
  end

  def std_attack(element, name, damage, mana)
    if $player_current_mana >= mana
      $player_current_mana -= mana
      puts "You use #{element}#{name}"
      if element == $player_type
        if $enemy_type == $player_type
          dmg_mult = 1
        elsif ($enemy_type == 'Fire' && $player_type == 'Water') or ($enemy_type == 'Water' && $player_type == 'Ice') or ($enemy_type == 'Ice' && $player_type == 'Fire') # find way to use array for this
          dmg_mult = 1.5
        else
          dmg_mult = 0.5
        end
      else
        dmg_mult = 1.1
      end
      Moves.roll_crit
      @@damage = ($player_current_damage * @crit_mult * dmg_mult * damage) / 100
      @@damage = @@damage.to_i
      $enemy_current_health = $enemy_current_health - @@damage
      puts "Enemy is dealt #{@@damage} damage"
      @turn_complete = 1 # does nothing right now
    else
      puts "Not enough mana!"
      @@damage = 0
    end
  end

  def indicate_damage
    damage = @@damage
  end

  def init_turn_complete
    @turn_complete = 0
  end

end
