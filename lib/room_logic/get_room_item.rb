require_relative 'room'
require_relative '../player_logic/player'


module GetRoomItem
  def pick_up_item(input)
    room_item = @current_room["item"]

    clear_text
    if room_item == input[1]
      @player.backpack.push(room_item)
    else
      puts "Thats not the correct INPUT!!!"
    end
  end
end
