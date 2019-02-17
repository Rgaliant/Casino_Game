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
      dealer_card = @deck.shuffle_cards
      user_card = @deck.shuffle_cards
      # binding.pry
      puts "Dealer hand #{dealer_card[0].rank} of #{dealer_card[0].suit} and #{dealer_card[1].rank} of #{dealer_card[1].suit}"
      puts "Your hand #{user_card[2].rank} of #{user_card[2].suit} and #{user_card[3].rank} of #{user_card[3].suit}"
      # binding.pry
      blackjack_menu(@player)
      
        
        
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