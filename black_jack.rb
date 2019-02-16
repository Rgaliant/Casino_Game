require_relative 'Deck'

class BlackJack

  def self.blackjack_menu(player)
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
        main_menu
      else
        puts "Invalid Input -- Please Try Again"
        blackjack_menu(@player)
    end 
  end


  def self.deal()
        puts "Bet is $25 per hand"
      deck = Deck.new
      
      #binding.pry
      dealer_cards = deck.shift(2)
      user_cards = deck.shift(2)
      #binding.pry
      dealer_total = dealer_cards[0].to_i + dealer_cards[1].to_i
      user_total = user_cards[0].to_i + user_cards[1].to_i
      puts "Dealer hand #{dealer_cards[0].rank} of #{dealer_cards[0].suit} and #{dealer_cards[1].rank} of #{dealer_cards[1].suit}"
      puts "Your hand #{user_cards[0].rank} of #{user_cards[0].suit} and #{user_cards[1].rank} of #{user_cards[1].suit}"
      # binding.pry
      case #dealer_total
      when dealer_total < user_total
        puts "Congrats you win: $50"
        @player.wallet = @player.wallet.to_i + 50
        puts "Here is you balance: #{@player.wallet}"
        blackjack_menu(@player)
      when dealer_total == user_total
        puts "You pushed. Play again"
        blackjack_menu(@player)
      when dealer_total > user_total
        puts "Sorry, you lose. Play again"
        @player.wallet = @player.wallet.to_i - 25
      end
  end
      
end