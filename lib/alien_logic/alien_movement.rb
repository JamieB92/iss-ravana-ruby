require_relative '../room_logic/room'
require_relative 'alien'

module AlienMovement
  ALIEN_DIRECTIONS = ["east", "west", "south", "north" ]

  def move_room_alien
    alien_moves = ALIEN_DIRECTIONS.sample
   
    if @alien_current_room["exits"].key?(alien_moves)
      alien_new_room_name = @alien_current_room["exits"][alien_moves]
      @alien_current_room_name = alien_new_room_name
      @alien_current_room = @rooms[alien_new_room_name]
      puts "alien went #{alien_moves} and moved to #{@alien_current_room_name}" 
    else
      puts "alien did not leave the room"
    end
  end

end
