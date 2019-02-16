# Basic Objectives:

# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Use classes to start the casino, bankroll, and each individual game
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses
 

# Bonus Objectives:

# Ability to move to and from games
# Find a gem that allows you to play sound and find casino sounds that will play on each game change/events
# Gem discovery: go to rubygems.org and find more gems that you want to implement in your project and use
# The player should have a Wallet and the Wallet should be its own class with remove and add methods (OOP)
# Find ASCII Art and put it into your games/menus to make it more fun for the end user
# Ability to switch players (player menu, bankroll information)
# Player's bankroll persists while moving from game to game
# Player's bankroll persists if you switch to different players
# Random events occur when changing games that can increase or decrease player's bankroll
# Roulette
# Craps
# Build a card deck (hint: this is in today's lesson content)
# Card games (Blackjack, Poker, Casino War, etc...)
# Any other Casino game you can think of
# Create your own game

require 'pry'
require_relative 'player'
require_relative 'input'
require_relative 'art'

class CasinoGame

  def self.welcome
    system "clear"
    Art.welcome(:light_blue, :blue)   
  end

  welcome
  
  @player = Player.new
  @mainMenuOptions = [{menuNumber: 1, displayText: "What are the odds", runCmd: 'WhatOdds.what_odds_menu(player)'}, #replace player with WhatOdds.what_odds_menu(player) 
                      {menuNumber: 2, displayText: "Slot Machine"     , runCmd: 'SlotMachine.slot_menu(player)'}, #replace player with SlotMachine.slot_menu(player)    
                      {menuNumber: 3, displayText: "Hi-Low"           , runCmd: 'HighLow.startGame(player)'}, #replace player with HiLow.greeting(player)         
                      {menuNumber: 4, displayText: "Test Game"        , runCmd: 'TestGame.main(player)'},       
                      {menuNumber: 5, displayText: "Double Or Nothing", runCmd: 'DoubleOrNothing.main(player)'},
                      {menuNumber: 6, displayText: "Exit"             , runCmd: 'SaveProgress.saveAndExit(player)'}]   

  def self.printPlayerInfo
    Art.playerInfo(@player)
  end

  def self.printMenu
    @mainMenuOptions.each { |opt| puts "#{opt[:menuNumber]}: #{opt[:displayText]}" }
    print "> "
  end
  
  def self.main_menu
    welcome
    printPlayerInfo
    printMenu
    @player = UserInput.menuSelect(@player, @mainMenuOptions)
    main_menu
  end
  
  main_menu
end
