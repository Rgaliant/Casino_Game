require 'colorize'

class Art
  def self.welcome(textColor, background)
    puts "---------".colorize(textColor).colorize(:background => background)
    puts "    " + "|".colorize(textColor).colorize(:background => background)
    print "Weco" + "m".colorize(:background => background) + "e to the Trinity Casino \n"
    puts "    " + "|".colorize(textColor).colorize(:background => background)   
    puts "    " + "|".colorize(textColor).colorize(:background => background)    
  end

  def self.playerInfo(player)
    puts "Player: " + "#{player.name}   $#{player.wallet}".colorize(player.color)
  end

end
