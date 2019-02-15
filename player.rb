class Player

  attr_accessor :name, :wallet

  def initialize
    getPlayerInfo
  end

  def getPlayerInfo
    puts "What is your name?"
    @name = gets.strip
    puts "Hello, #{name}, and how much money will you be playing with?"
    @wallet = gets.strip
  end  
 #bonus method for player settings
end