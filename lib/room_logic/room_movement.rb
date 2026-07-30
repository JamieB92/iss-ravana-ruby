require_relative 'room'
require_relative 'get_room_item'
require_relative '../player_logic/player'
require_relative '../drone_alien_logic/drone_alien_movement'
require_relative '../combat_logic/combat'
require_relative '../challenge_logic/cryo_bay'

module RoomMovement
  include DroneAlienMovement
  include Combat

  def move_room(input)
    if @current_room["exits"].key?(input[1])
      new_room_name = @current_room["exits"][input[1]]
      @current_room_name = new_room_name
      @current_room = @rooms[new_room_name]
      @current_room_description = @rooms[new_room_name]["description"]
      enter_room
      fight || move_room_drone_alien
    else
      clear_text
      puts "You can't go that way"
    end
  end

  def check_room_for_item
    @player.backpack.include?(@current_room["item"])
  end

  def enter_room
    clear_text

    if !@current_room["item"].nil? && check_room_for_item == false
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    #{@current_room_description}"
      sleep(2)
      puts "    #{@current_room_puzzle}"
      get_room_puzzle_logic
    elsif !@current_room["item"].nil? && check_room_for_item == true
      puts "\n  > ENTERING #{@current_room_name.upcase} \n SCAN COMPLETE -- NO OBJECTS DETECTED"
    else
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- NO OBJECTS DETECTED"
    end
  end
end