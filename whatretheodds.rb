# require_relative "../Casino_Game/casino.rb"
require 'pry'
require 'colorize'


class WhatOdds
def initialize 
  what_odds_menu
end

def what_odds_menu 
  puts "Welcome to What Are The Odds!!"
  puts "1) Play the Game"
  puts "2) See the Rules"
  puts "3) Back to Casino"
  choice = gets.to_i
  case choice
  when 1
    whatre_the_odds
  when 2
    puts "You must choose a number between 1 and 10.".colorize(:green)
    puts "There will be two numbers chosen, if both numbers add up to the number you chose, you win.".colorize(:green)
    puts "The higher the number, the bigger payout".colorize(:green)
    what_odds_menu
  when 3
    main_menu
  end
end

def whatre_the_odds
  puts "How much is your bet?"
  bet = gets.strip
  puts "WHAT'RE the ODDS"
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
  end
  player1 = rand(odds.to_f)
  player2 = rand(odds.to_f)
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
    puts "YOU WIN!!"
    puts
    puts "💰 💰 💰 💰 💰 💰 💰"
    puts "You just won $#{total_win}!!".colorize(:green)
    puts "Nice work!"
    
    whatre_the_odds
    ## add total_final to player wallet
  else 
    puts "Play again"
    puts "-" * 50
    what_odds_menu
    ## subtract bet from player wallet
  end
  end
end


WhatOdds.new
