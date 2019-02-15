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
require 'pry'
require_relative 'player'

class CasinoGame
  @games = ["game1", "game2", "game3"]
  @player = nil

  def self.welcome
    puts "Welcome to the Trinity Casino"
  end
  
  def self.printMenu
    @games.each_with_index { |game, index| puts "#{index}) #{game}" }
  end
  
  def self.userSelection
    gets
    puts "selected"
    main_menu
  end
  
  def self.main_menu
    welcome
    if @player == nil
      @player = Player.new
    end
    printMenu
    userSelection
  end

  main_menu
end

CasinoGame

#test comment