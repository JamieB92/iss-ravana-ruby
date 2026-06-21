require_relative '../classes/room'
require_relative '../classes/player'


module GetRoomItem
  def pick_up_item(input)
    room_item = @current_room["item"]

    if room_item == input[1]
      @player.backpack.push(room_item)
    else
      puts "Thats not the correct INPUT!!!"
    end
  end
end
