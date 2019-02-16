# require_relative 'whatretheodds'
# require_relative 'slot'
# require_relative 'HighLow'
require 'colorize'
require_relative 'testGame'
require_relative 'appErrors'
require_relative 'saveProgress'

class UserInput

  def self.menuSelect(player, menuOptions)
  
    userChoice = gets.to_i
    
    case userChoice
      when 1..menuOptions.length
      player = eval(menuOptions[userChoice - 1][:runCmd])
      else
      AppErrors.errorInvalidChoice
      menuSelect(player, menuOptions)
    end

    return player
  end

end


