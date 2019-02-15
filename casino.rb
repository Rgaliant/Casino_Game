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
require_relative 'testGame'

class CasinoGame
  @games = ["What are the odds", "Slot Machine", "Hi-Low", "Test Game"]
  @player = nil

  def self.welcome
    puts "Welcome to the Trinity Casino"
  end
  
  def self.printMenu
    @games.each_with_index { |game, index| puts "#{index + 1}) #{game}" }
  end
  
  def self.userSelection
    userChoice = gets.strip.to_i
    case userChoice
    when 1
      WhatOdds.new(@player)
      # @player = WhatOdds.updatePlayerInfo
      puts "odds"
    when 2
      # SlotMachine.new(@player)
      puts "slots"
    when 3
      # Hilo.new(@player)
    when 4
      TestGame.new(@player)
      puts"back"
      gets
    else
      puts "hilo"
    end
    puts "selected"
    p @player
    main_menu
  end
  
  def self.main_menu
    welcome
    if @player == nil
      @player = Player.new
      p @player
    end
    printMenu
    userSelection
  end

  main_menu
end

CasinoGame

#test comment