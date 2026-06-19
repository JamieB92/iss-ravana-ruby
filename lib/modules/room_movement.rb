require_relative '../classes/room'

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
  
  def enter_room
    if !@current_room["item"].nil?
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- OBJECT DETECTED: #{@current_room["item"].upcase}"
    else
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- NO OBJECTS DETECTED"
    end
  end
end