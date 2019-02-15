#require_relative "casino.rb"
require_relative "Card.rb"
require_relative "Deck.rb"
require "pry"

class HighLow 
  def initialize(player)
    # variables to be added 
    @player = player
    wallet = 50
    greeting
  end

  # splash screen w/ ascii art 
  def greeting
    puts "*********************"
    puts "*Welcome to High/Low*"
    puts "*********************"
    sleep(5)
  end

end

HighLow.new(nil)