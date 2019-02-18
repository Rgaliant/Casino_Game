=begin

To Do:
wallet transactions
add color

***random event(s)***

=end

#require_relative "casino.rb"
require_relative "Card.rb"
require_relative "Deck.rb"
require "pry"
require "colorize"

class HighLow 
  def self.startGame(player)
    @player = player
    @deck = Deck.new
    @games = 0
    @wins = 0
    @losses = 0
    @ties = 0
    @pct = 0.0
    @bank = 0
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
    puts "Welcome #{@player.name}"
    puts "You have $ #{@player.wallet}"
    puts 
    puts "RULES: Dealer will draw a card. Guess if the next card will be higher or lower"
    puts "WAGER: $10 per game"
    puts
    puts "type (q)uit to go back"
    puts "or push enter to start playing"
    choice = gets.strip.downcase
    if !!choice.match(/^q.*/)
      return @player
    else
      sleep(1)
      puts
      shuffle
    end
  end

  def self.shuffle
      # shuffle, draw 1st card, delete card from deck
      @deck.shuffle_cards
      puts "Dealer draws..."
      sleep(1)
      @first_value = @deck.draw(0)
      @deck.cards.slice!(0)
      puts
      sleep(1)
      game
  end

  # game loops until player out of money or quits
  def self.game
    puts "Will the next card be"
    puts "(H)igher    (L)ower  "
    puts "     ¯\\_(ツ)_/¯     "
    print "> "
    @choice = gets.strip.downcase
    if !!@choice.match(/^h.*/)
      @higher = true
    elsif !!@choice.match(/^l.*/)
      @higher = false
    else
      puts "invalid choice. Please try again"
      game
    end
    # binding.pry
    # wager may be removed later 
    # puts "How much will you wager?"
    # @wager = gets.to_i
    puts
    sleep(1)
    puts "Dealer draws..."
    @second_value = @deck.draw(0)
    @deck.cards.slice!(0)
    sleep(1)
    # binding.pry
    result
    reset
  end

  def self.result
    if ((@first_value.rank < @second_value.rank) && (@higher == true))
      puts " Winner"
      @wins += 1
      @bank += 10
      # wallet stuffs
    elsif ((@second_value.rank < @first_value.rank) && (@higher == false))
      puts "Winner"
      @wins += 1
      @bank += 10
      #wallet stuffs
    elsif (@first_value.rank == @second_value.rank)
      puts "Tie"
      @ties += 1
      # wallet stuffs
    else 
      puts "Wrong!"
      @losses += 1
      @bank -= 10
      #wallet stuffs
    end
    puts
    sleep(1)
  end

  def self.reset
    @first_value = @second_value
    @games += 1
    @pct = ((@wins / @games) * 100)
    # wallet stuffs
    puts
    sleep(1)
    menu
  end

  def self.menu
    puts "**********************************"
    puts "* #{@player.name}                     *"
    puts "* Wallet: $#{@player.wallet}      *"
    puts "**********************************"
    puts "Wins: #{@wins} Losses: #{@losses} Ties: #{@ties}"
    puts "Hi/Low Winnings: $#{@bank}"
    puts "Winning Percentage: #{@pct}%"
    puts 
    puts "type (q)uit to go back"
    puts "Or push enter to play again"
    choice = gets.strip.downcase
    if !!choice.match(/^q.*/)
      puts "Thanks for playing"
      sleep(3)
      return @player
    else
      puts "The #{@first_value.rank} of #{@first_value.suit}"
      puts
      game
    end
  end

end

# for testing
# HighLow.new(nil)