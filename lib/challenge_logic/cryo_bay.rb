require_relative '../game_logic/game'

module CryoBayChallenge

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

  def player_guess_cipher
    cipher_player_name
    cryo_bay_chalenge_complete = false

    puts "Enter the cipher below:"
    input = player_input.downcase

    while cryo_bay_chalenge_complete == false
      if input == cipher_name.join
        sleep(1)
        clear_text
        puts "    You find : #{@current_room["item"].upcase} and can pick it up"
        cryo_bay_chalenge_complete = true
      else
        puts "Incorrect, try again"
        input = player_input.downcase
      end
    end
  end
end