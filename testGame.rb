class TestGame

  attr_accessor :player

  def initialize(player)
    @player = player
    puts "menu"
    p @player
    TestGame.main(@player)
  end

  def self.main(playerInfo)
  ### main game 
  playerInfo.wallet = 24040 #new wallet balance
  return playerInfo
  end

end