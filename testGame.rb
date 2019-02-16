class TestGame
  def self.main(player)
    p @player = player
    p @player.wallet = "16" #to access wallet
    p @player.name = "james" # to access name
      @player.color = :magenta
    return @player 
  end
end
