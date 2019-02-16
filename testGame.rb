class TestGame
  def self.main(player)
    p @player = player
    p @player.wallet  #to access wallet
    p @player.name # to access name
    return @player 
  end
end
