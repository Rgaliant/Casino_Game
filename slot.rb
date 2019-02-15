require_relative 'casino.rb'
require "pry"

# slots.wallet

class SlotMachine
  attr_accessor :name, :wallet
  def initialize(player)
    @slot_machine = [2, 4, 6, 8]
    @slot_answer = []
    @winnings = []
    @name = player[:name]
    @wallet = player[:wallet]
    slot_menu
  end

  def slot_menu
    puts "Press (1) to play slot machine."
    puts "Press (2) to see winnings."
    puts "Press (3) to exit slot machine."
    choose
  end

  def choose
    case gets.to_i
    when 1
      pay
    when 2
      puts @winnings
    when 3
      exit
    else 
      puts "Invalid choice. Choose again."
    end
  end

  def pay
    puts "This Slot Machine is $1 per play."
    puts "Press (1) to continue "
  end

  def play_slot
    puts "Type (PULL) to pull slot lever."
    pull = gets.upcase.strip 
      if pull == "PULL"
        slot_game
      else
        puts "Oops. Try again please."
      end
        play_slot
  end

  def slot_game
    answer1 = @slot_machine.sample
    answer2 = @slot_machine.sample
    answer3 = @slot_machine.sample
    @slot_answer.push(answer1, answer2, answer3)
    slot_output
  end

  def slot_output
    puts @slot_answer
    if answer1 == answer2 && answer2 == answer3
      puts "You Win!"
    else 
      puts "You Lose..."
    end
  end 

end
