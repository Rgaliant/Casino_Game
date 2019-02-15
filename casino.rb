## class to handle game
## methods for little games
## class to handle person and wallet amount, user bankroll persists
## Start game player has a name and initial bankroll
#player can go 
# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Use classes to start the casino, bankroll, and each individual game
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses

class CasinoGame
  @player = []

  main_menu
  def main_menu
    puts "Welcome to OUR Casino"
    puts "What is your name?"
    name = gets.strip
    puts "Hello, #{name}, and how much money will you be playing with?"
    wallet = gets.strip

    case name
    when "\d"
      puts "Invalid Entry"
    else
      @name << name
    end
    return { name: name, wallet: wallet }
  end
end

CasinoGame.new