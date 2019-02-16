=begin

To Do:
finish game xp
player menu
add color

=end

#require_relative "casino.rb"
require_relative "Card.rb"
require_relative "Deck.rb"
require "pry"

class HighLow 
  def initialize(player)
    @player = player
    @deck = Deck.new
    @games = 0
    @winnings = 0
    @choice = ""
    @wager = ""
    greeting
  end

  # splash screen w/ ascii art
  # self.main
  def greeting
    puts
    puts "        High / Low          "
    puts "                    .------."                                     
    puts " .------.           |A .   |"   
    puts " |A_  _ |    .------; / \\  |"
    puts " |( \\/ )|-----. _   |(_,_) |"   
    puts " | \\  / | /\\  |( )  |  I  A|"                                      
    puts " |  \\/ A|/  \\ |_x_) |------'"                                      
    puts " `-----+'\\  / | Y  A|       "                                      
    puts "       |  \\/ A|-----'       "                               
    puts "       `------'             "
    # puts "Welcome #{@player.name}"

    sleep(3)
    puts
    #menu
    game
  end

  # shuffle, draw a card, delete drawn card
  def shuffle 
    @deck.shuffle_cards
    puts "Dealer draws..."
    @deck.draw(0)
    @deck.cards.slice!(0)
    puts
  end

  # game area
  def game
    shuffle
    puts "Will the next card be"
    puts "(H)igher    (L)ower  "
    puts "     ¯\\_(ツ)_/¯     "
    print "> "
    @choice = gets.strip.downcase
    # wager may be removed later 
    puts "How much will you wager?"
    @wager = gets.to_i
  end

  def result
  end

end

# for testing
# HighLow.new(nil)