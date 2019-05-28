module Moves

  def choose(dec)
    case dec
    when 1
      Moves.attack
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
      if $player_current_mana >= 10
        $player_current_mana -= 10
        puts "You use #{$player_type} Ball" # add crit system
      else
        print "Not enough mana!"
      end
    when 2
      if $player_current_mana >= 20
        $player_current_mana -= 20
        puts "You use #{$player_type} Storm"
      else
        print "Not enough mana!"
      end
    when 3
      if $player_current_mana >= 60
        $player_current_mana -= 60
        puts "You use Meteor"
      else
        print "Not enough mana!"
      end
    when 4
      if $player_current_mana >= 15
        $player_current_mana -= 15
        puts "You use Leech"
      else
        print "Not enough mana!"
      end
    when 5
      if $player_current_mana >= 0
        $player_current_mana -= 0
        puts "You use Wand Strike"
      else
        print "You should never see this text, contact the developer."
        Kernel.abort("Unhandled exception in #{__LINE__}")
      end
    when 6

    else
      puts "Invalid move."
    end
  end

end
