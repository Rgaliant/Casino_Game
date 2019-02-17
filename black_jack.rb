require_relative "Card.rb"
require_relative "Deck.rb"
require "pry"

class BlackJack

  def self.blackjack_menu(player)
    @deck = Deck.new
    @player = player
    puts "Welcome to BlackJack"
    puts "What would you like to do?"
    puts "Rules - Deal, then decide to hit or stay---over 21 is a bust"
    puts "1) to play"
    puts "2) to exit"
    action = gets.strip.to_i
    case action
      when 1
        deal()
      when 2
        return player
      else
        puts "Invalid Input -- Please Try Again"
        blackjack_menu(player)
    end 
  end


  def self.deal()
        puts "Bet is $25 per hand"
      bet = 25
      
      #binding.pry
      @dealer_card = @deck.shuffle_cards
      @user_card = @deck.shuffle_cards
      # binding.pry
      puts "Dealer hand #{@dealer_card[0].rank} of #{@dealer_card[0].suit} and #{@dealer_card[1].rank} of #{@dealer_card[1].suit}"
      puts "Your hand #{@user_card[2].rank} of #{@user_card[2].suit} and #{@user_card[3].rank} of #{@user_card[3].suit}"
      # binding.pry
      @dealer_total = @dealer_card[0].rank.to_i + @dealer_card[1].rank.to_i
      @user_total = @user_card[2].rank.to_i + @user_card[3].rank.to_i
      # binding.pry
      decision()
  end
    def self.decision()
      puts "You currently have #{@user_total}"
      puts "Do you want to hit or stay? (you may only hit once)"
      decision1 = gets.strip.downcase

      if decision1 == "hit"
        @user_total = @user_total + @user_card[4].rank.to_i
        puts "You currently have #{@user_total}"
        dealer()
        # if @user_total > 21
        #   puts "BUST"
        #   puts "Sorry, you lose. Play again"
        #  @player.wallet = @player.wallet.to_i - 25
        #  blackjack_menu(@player)
        # else
        #   dealer()
        # end
      else 
        dealer()
    end
  end


      def self.dealer()
        puts "Dealer is at #{@dealer_total}"
        if @dealer_total >= 16
          puts "Dealer chooses to stay"
          winner()
        else @dealer_total <= 15
          puts "Dealer chooses to hit"
          @dealer_total = @dealer_total + @dealer_card[5].rank.to_i
          puts "Dealer is at #{@dealer_total}"
          winner()
        end
      end

      def self.winner()
      puts "Calculating..."
      sleep 1
      if @dealer_total > @user_total
        puts "Sorry you lose, play again"
        @player.wallet = @player.wallet.to_i - 25
        sleep 1
        blackjack_menu(@player)
      elsif @dealer_total < @user_total
        puts "We have a WINNER!"
        puts "     _     _  ___   __    _  __    _  _______  ______    __   __  
    | | _ | ||   | |  |  | ||  |  | ||       ||    _ |  |  | |  | 
    | || || ||   | |   |_| ||   |_| ||    ___||   | ||  |  | |  | 
    |       ||   | |       ||       ||   |___ |   |_||_ |  | |  | 
    |       ||   | |  _    ||  _    ||    ___||    __  ||__| |__| 
    |   _   ||   | | | |   || | |   ||   |___ |   |  | | __   __  
    |__| |__||___| |_|  |__||_|  |__||_______||___|  |_||__| |__| "
    puts
    puts "💰 💰 💰 💰 💰 💰 💰"
        @player.wallet = @player.wallet.to_i + 50
        puts "You just won $50"
        sleep 1
        blackjack_menu(@player)
      else
        puts "PUSH play again"
        blackjack_menu(@player)
      end
        
      end
      
      
        
        
  end
      



# puts "Congrats you win: $50"
#         @player.wallet = @player.wallet.to_i + 50
#         puts "Here is you balance: #{@player.wallet}"
#         blackjack_menu(@player)
#       when dealer_total == user_total
#         puts "You pushed. Play again"
#         blackjack_menu(@player)
#       when dealer_total > user_total
#         puts "Sorry, you lose. Play again"
#         @player.wallet = @player.wallet.to_i - 25