require_relative '../classes/room'
require_relative 'get_room_item'
require_relative '../classes/player'

module RoomMovement
  def move_room(input)
    if @current_room["exits"].key?(input[1])
      new_room_name = @current_room["exits"][input[1]]
      @current_room_name = new_room_name
      @current_room = @rooms[new_room_name]
      enter_room
    else
      puts "You can't go that way"
    end
  end

  def check_for_item_in_backpack
    @player.backpack.include?(@current_room["item"])
  end

  def enter_room
    if !@current_room["item"].nil?
      return puts "\n  > ENTERING #{@current_room_name.upcase} \n SCAN COMPLETE -- NO OBJECTS DETECTED" if check_for_item_in_backpack

      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- OBJECT DETECTED: #{@current_room["item"].upcase}"
    else
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- NO OBJECTS DETECTED"
    end
  end
end