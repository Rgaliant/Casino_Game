class DoubleOrNothing
  def self.main(player)
    system("Clear")
    puts "Double or Nothing"
    puts "You Have " + "$#{player.wallet}".colorize(player.color)
    puts "Press Enter to risk it all or q to quit"
    print ">"
    case gets.strip
    when "q", "quit", "exit"
    # do nothing
    else
      player.wallet = bet(player.wallet)
      main(player)
    end
    return player 
  end

  def self.bet(wallet)
    coinFlip = rand(1..2)
    case coinFlip
      when 1
      wallet *= 2
      puts "DOUBLE".colorize(:light_green)
      puts "Press Enter"
      gets
      when 2
      wallet = 1
      puts "NOTHING"
      puts "Too bad! But here is $1 for trying"
      print "Press Enter"
      gets
    end
    return wallet
  end
end
