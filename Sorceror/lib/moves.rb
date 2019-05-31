module Moves

  def choose(dec)
    case dec
    when 1
      attack
    when 2
      puts "Uti"
    when 3
      puts "Def"
    when 4
      recover
    when 5
      puts "Don"
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
      std_attack($player_type, " Ball", 10, 10)
    when 2
      std_attack($player_type, " Storm", 24, 20) # change in future
    when 3
      std_attack("", "Meteor", 50, 60)
    when 4
      std_attack("", "Leech", 10, 15) # change in future
    when 5
      std_attack("", "Wand Strike", 4, 0)
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
      @crit = 1
    elsif crit >= 90
      puts "Miss!"
      @crit = 2
    else
      @crit = 0
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
      puts "You use #{element}#{name}" # add crit system
      roll_crit
    else
      print "Not enough mana!"
    end
  end

end
