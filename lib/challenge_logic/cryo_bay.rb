require_relative '../game_logic/game'

module CryoBayChallenge

  def cryo_bay_chalenge_completed
      @cryo_bay_chalenge_complete = false
  end

  def cipher_player_name
    cipher_name = []

    alphabet = ("a".."z").to_a

    @player.name.downcase.chars.each do |char|
      index = alphabet.index(char)
      
      if alphabet.include?(char)
        new_char = alphabet[(index + 3) % 26]
        cipher_name.push(new_char)
      else
        cipher_name.push(char)
      end
    end
    
    cipher_name.join
  end
end