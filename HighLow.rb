=begin

To Do:
wallet transactions
player menu
add color

***random event(s)***

=end

require_relative "casino.rb"
require_relative "Card.rb"
require_relative "Deck.rb"
require "pry"
require "colorize"

class HighLow 
  def self.startGame(player)
    @player = player
    @deck = Deck.new
    @games = 0
    @winnings = 0
    @done_playing = false
    @choice = ""
    @higher = true
    @first_value = []
    @second_value = []
    @wager = ""
    greeting
  end

  # splash screen w/ ascii art
  # self.main
  def self.greeting
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
    #puts "Welcome #{@player.name}"

    sleep(3)
    puts
    #menu
    shuffle
  end

  def self.shuffle
      # shuffle, draw 1st card, delete card from deck
      @deck.shuffle_cards
      puts "Dealer draws..."
      @first_value = @deck.draw(0)
      @deck.cards.slice!(0)
      puts
      sleep(1)
      game
  end

  # user choice
  def self.game
    while !@done_playing
      puts "Will the next card be"
      puts "(H)igher    (L)ower  "
      puts "     ¯\\_(ツ)_/¯     "
      print "> "
      @choice = gets.strip.downcase
      if !!@choice.match(/^h.*/)
        @higher = true
      elsif !!@choice.match(/^l.*/)
        @higher = false
      elsif !!@choice.match(/^q.*/)
        @done_playing = true
      else
        puts "invalid choice. Please try again"
        game
      end
      break if @done_playing == true
      # binding.pry
      # wager may be removed later 
      # puts "How much will you wager?"
      # @wager = gets.to_i
      sleep(1)
      puts "Dealer draws..."
      @second_value = @deck.draw(0)
      @deck.cards.slice!(0)
      binding.pry
      result
      reset
    end
    return @player
  end

  def self.result
    if (@first_value.rank < @second_value.rank) && (@higher == true)
      puts " Winner"
      # wallet stuffs
    elsif (@first_value.rank > @second_value.rank) && (@higher == false)
      puts "Winner"
      #wallet stuffs
    elsif (@first_value.rank == @second_value.rank)
      puts "Tie"
      # wallet stuffs
    else 
      puts "Wrong!"
      #wallet stuffs
    end
    puts
    sleep(1)
  end

  def self.reset
    @first_value = @second_value
    @games += 1
    #wallet stuffs
    # total winnings
    puts
    sleep(1)
  end

end

# for testing
<<<<<<< HEAD
HighLow.startGame(nil)
=======
# HighLow.startGame(poop)
>>>>>>> 355bdac2d8682008ff0693c7be476d5cc60fe8a6
