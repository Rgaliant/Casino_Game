class Player

  attr_accessor :name, :wallet, :color

  def initialize
    getPlayerInfo
    @color = :light_blue
  end

  def getPlayerInfo
    puts "What is your name?"
    @name = gets.strip
    puts "Hello, #{name}, and how much money will you be playing with?"
    @wallet = gets.strip.to_i
  end  

  def changePlayerColor
  end

  def changePlayerName
  end
  
 #bonus method for player settings
end