module Moves

  def choose(dec)
    case dec
    when 1
      Moves.attack # I know I don't need to declare the module but it's for clarity
    when 2
      puts "Uti"
    when 3
      puts "Def"
    when 4
      Moves.recover
    when 5
      puts "You do nothing."
    else
    end
  end

  def attack
    puts "What attacking move would you like to use?"
    # pokemon-style type weaknesses
    puts "1. #{$player_type} Ball     10 Base Damage      10 Mana"
    puts "2. #{$player_type} Storm    24 Base Damage      20 Mana" # TODO // make this ability do 12 damage per turn
    puts "3. Meteor        50 Base Damage      60 Mana"
    puts "4. Leech         10 Base Damage      15 Mana" # TODO // make this ability leech 10 hp
    puts "5. Wand Strike   4 Base Damage       0 Mana"
    puts "6. Cancel"
    # need to loop this
    print ">"
    move = $stdin.gets.chomp
    move = move.to_i
    case move
    when 1
      Moves.std_attack($player_type, " Ball", 10, 10)
      puts "Damage #{@@damage}"
    when 2
      Moves.std_attack($player_type, " Storm", 24, 20) # change in future
      puts "Damage #{@@damage}"
    when 3
      Moves.std_attack("", "Meteor", 50, 60)
      puts "Damage #{@@damage}"
    when 4
      Moves.std_attack("", "Leech", 10, 15) # change in future
      puts "Damage #{@@damage}"
    when 5
      Moves.std_attack("", "Wand Strike", 4, 0)
      puts "Damage #{@@damage}"
    when 6
      return
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
  end

  def std_attack(element, name, damage, mana)
    if $player_current_mana >= mana
      $player_current_mana -= mana
      puts "You use #{element}#{name}"
      if element == $player_type
        if $enemy_type == $player_type
          dmg_mult = 1
        elsif ($enemy_type == 'Fire' && $player_type == 'Water') or ($enemy_type == 'Water' && $player_type == 'Ice') or ($enemy_type == 'Ice' && $player_type == 'Fire')
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
    else
      puts "Not enough mana!"
      @@damage = 0
    end
  end

end
