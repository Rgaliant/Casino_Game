class TestGame
  def self.main(player)
    p @player = player
    p @player.wallet = rand(1..100000) #to access wallet
    p @player.name = "TestName" # to access name
      @player.color = :magenta
    return @player 
  end
end
