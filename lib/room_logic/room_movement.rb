require_relative 'room'
require_relative 'get_room_item'
require_relative '../player_logic/player'
require_relative '../alien_logic/alien_movement'

module RoomMovement
  include AlienMovement

  def move_room(input)
    if @current_room["exits"].key?(input[1])
      new_room_name = @current_room["exits"][input[1]]
      @current_room_name = new_room_name
      @current_room = @rooms[new_room_name]
      enter_room
      move_room_alien
    else
      puts "You can't go that way"
    end
  end

  def check_room_for_item
    @player.backpack.include?(@current_room["item"])
  end

  def enter_room
    if !@current_room["item"].nil? && check_room_for_item == false
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- OBJECT DETECTED: #{@current_room["item"].upcase}"
    elsif !@current_room["item"].nil? && check_room_for_item == true
      puts "\n  > ENTERING #{@current_room_name.upcase} \n SCAN COMPLETE -- NO OBJECTS DETECTED"
    else
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- NO OBJECTS DETECTED"
    end
  end
end