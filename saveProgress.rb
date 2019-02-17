class SaveProgress
    def self.savePlayerData(player)
      #save data
      puts "game data saved"
      p player
    end

    def self.saveAndExit(player)
      savePlayerData(player)
      puts "Exit Program"
      p player
      exit
    end
  end
