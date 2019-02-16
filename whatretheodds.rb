#require_relative 'casino'
require 'pry'
require 'colorize'


class WhatOdds

def self.what_odds_menu(player)
  system("clear")
  @player = player
  print"Welcome to"
  puts " What Are The Odds!!".colorize(:blue)
  puts "1) Play the Game"
  puts "2) See the Rules"
  puts "3) Back to Casino"
  choice = gets.to_i
  case choice
  when 1
    whatre_the_odds
  when 2
    puts "You must choose a number between 1 and 10.".colorize(:green)
    puts "There will be two numbers chosen between 1 and 5 times your choice, if both numbers add up to the number you chose, you win.".colorize(:green)
    puts "The higher the number, the bigger payout".colorize(:green)
    #sleep 1
    puts "Press Enter"
    gets
    what_odds_menu(@player)
  when 3
    return @player
  end
end

def self.whatre_the_odds
  puts "-".colorize(:green) * 50
  puts "How much is your bet?"
  bet = gets.strip.to_i
  puts "   _     _  __   __  _______  _______  __   ______    _______    _______  __   __  _______    _______  ______   ______   _______ 
  | | _ | ||  | |  ||   _   ||       ||  | |    _ |  |       |  |       ||  | |  ||       |  |       ||      | |      | |       |
  | || || ||  |_|  ||  |_|  ||_     _||__| |   | ||  |    ___|  |_     _||  |_|  ||    ___|  |   _   ||  _    ||  _    ||  _____|
  |       ||       ||       |  |   |       |   |_||_ |   |___     |   |  |       ||   |___   |  | |  || | |   || | |   || |_____ 
  |       ||       ||       |  |   |       |    __  ||    ___|    |   |  |       ||    ___|  |  |_|  || |_|   || |_|   ||_____  |
  |   _   ||   _   ||   _   |  |   |       |   |  | ||   |___     |   |  |   _   ||   |___   |       ||       ||       | _____| |
  |__| |__||__| |__||__| |__|  |___|       |___|  |_||_______|    |___|  |__| |__||_______|  |_______||______| |______| |_______|                                                                               "  
  puts "WHAT'RE the ODDS".colorize(:cyan)
  puts "-".colorize(:green) * 50
  puts "Choose a number between 1 and 10."
  odds = gets.to_i
  case odds
  when (1..5)
    total_win = bet * 2
  when (6..8)
    total_win = bet * 3
  when 9
    total_win = bet * 4
  when 10
    total_win = bet * 10
  else
    puts "invalid entry"
    what_odds_menu(@player)
  end
  player1 = rand(odds.to_f * 2)
  player2 = rand(odds.to_f * 2)
  puts "-------------------------".colorize(:cyan)
  puts "calculating....."
  sleep 2
  puts "Player 1 number is #{player1}"
  sleep 1
  puts "Player 2 number is #{player2}"
  puts
  puts "-------------------------".colorize(:cyan)
  puts
  sleep 1
  if player1 == player2
    puts "YOU WIN!!".colorize(:green)
    puts "     _     _  ___   __    _  __    _  _______  ______    __   __  
    | | _ | ||   | |  |  | ||  |  | ||       ||    _ |  |  | |  | 
    | || || ||   | |   |_| ||   |_| ||    ___||   | ||  |  | |  | 
    |       ||   | |       ||       ||   |___ |   |_||_ |  | |  | 
    |       ||   | |  _    ||  _    ||    ___||    __  ||__| |__| 
    |   _   ||   | | | |   || | |   ||   |___ |   |  | | __   __  
    |__| |__||___| |_|  |__||_|  |__||_______||___|  |_||__| |__| "
    puts
    puts "💰 💰 💰 💰 💰 💰 💰"
    puts "You just won $#{total_win}!!".colorize(:green)
    puts "Nice work!"
    @player.wallet = @player.wallet.to_i + total_win.to_i
    puts"Your total wallet is now $#{@player.wallet}"
    puts
    what_odds_menu(@player)
    ## add total_final to player wallet
  else 
    @player.wallet = @player.wallet.to_i - bet.to_i
    puts "You lose".colorize(:red)
    puts "Play again"
    puts "Remaining balance is: $#{@player.wallet}"
    puts "-" * 50
    
    what_odds_menu(@player)
    ## subtract bet from player wallet
  end
  end


end



