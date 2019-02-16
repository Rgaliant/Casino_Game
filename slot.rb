#require_relative 'casino.rb'
require "pry"

# slots.wallet

class SlotMachine

  def self.slot_menu(player)
    @playerInfo = player
    @slot_machine = [2, 4, 6, 8]
    @slot_answer = []
    wallet = @playerInfo.wallet
    name = @playerInfo.name
    puts "Press (1) to play slot machine."
    puts "Press (2) to see winnings."
    puts "Press (3) to exit slot machine."
    choose
  end

  def self.choose
    case gets.to_i
    when 1
      pay
    when 2
      puts @winnings
      puts "Press Enter"
      gets
      slot_menu(@playerInfo) #go back to beginning
    when 3
      #exit
      return @playerInfo
    else 
      puts "Invalid choice. Choose again."
      choose
    end
  
  end

  def self.pay
    puts "This Slot Machine is $1 per play."
    puts "Press (1) to continue."
    puts "Press (2) to exit."
    puts "Press Enter"
    choice=gets.to_i
      case choice
      when 1
        play_slot
      when 2
        slot_menu(@playerInfo) #go back to beginning
      end
  end

  def self.play_slot
    puts "Type (PULL) to pull slot lever."
    pull = gets.upcase.strip 
      if pull == "PULL"
        slot_game
      else
        puts "Oops. Try again please."
      end
        play_slot
  end

  def self.slot_game
    answer1 = @slot_machine.sample
    answer2 = @slot_machine.sample
    answer3 = @slot_machine.sample
    @slot_answer.push(answer1, answer2, answer3)
    slot_output
  end

  def self.slot_output
    puts @slot_answer
    if answer1 == answer2 && answer2 == answer3
      puts "You Win!"
    else 
      puts "You Lose..."
    end
    slot_menu(@playerInfo) #go back to beginning
  end 

end
