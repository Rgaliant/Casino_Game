#require_relative 'casino.rb'
require "pry"
#require_relative "casino.rb"

# slots.wallet

class SlotMachine

  def self.slot_menu(player)
    @player = player
    @slot_machine = [2, 4, 6, 8]
    @slot_answer = []
    puts "Hello, #{@player.name}. Welcome to Infinity Casino's Slot Machine Game."
    puts "Press (1) to play Slot Machine."
    puts "Press (2) to see Bankroll."
    puts "Press (3) to exit Slot Machine."
    puts "--------------------------------"
    choose
  end

  def self.choose
    case gets.to_i
    when 1
      pay
    when 2
      puts "Your Bankroll amount is: #{@player.wallet}"
      puts "--------------------------------"
      slot_menu(@player) #go back to beginning
    when 3
      #exit
      puts "Thanks for playng. Hope to see you soon."
      return @player
    else 
      puts "Invalid choice. Choose again."
      choose
    end
  
  end

  def self.pay
    puts "--------------------------------"
    puts "This Slot Machine is $1 per play."
    puts "However, if you win you get $100."
    puts "Press (1) to play."
    puts "Press (2) to return to Slot Machine Menu."
    puts "--------------------------------"
    choice = gets.to_i
      case choice
      when 1
       slot_game
      when 2
        slot_menu(@player) #go back to beginning
      else
        "Oops! Try again."
      end
  end

  def self.slot_game
    @answer1 = @slot_machine.sample
    @answer2 = @slot_machine.sample
    @answer3 = @slot_machine.sample
    @slot_answer.push(@answer1, @answer2, @answer3)
    slot_output
  end

  def self.slot_output
    puts "--------------------------------"
    puts "(#{@answer1}, #{@answer2}, #{@answer3})"
    puts "--------------------------------"
    if @answer1 == @answer2 && @answer2 == @answer3
      puts "You Win!"
      puts "--------------------------------"
      @player.wallet = @player.wallet.to_i + 100
      slot_menu(@player)
    else 
      puts "You Lose..."
      puts "--------------------------------"
      @player.wallet = @player.wallet.to_i - 1
      slot_menu(@player)
    end
  end 

end
