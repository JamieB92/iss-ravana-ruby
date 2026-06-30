require_relative '../room_logic/room'
require_relative 'alien'

module AlienMovement
  def move_room_alien
    does_alien_move = [true, false]
    does_it_move = does_alien_move.sample

    if does_it_move == true
      direction = @alien_current_room["exits"].keys.sample
      alien_new_room_name = @alien_current_room["exits"][direction]
      @alien_current_room_name = alien_new_room_name
      @alien_current_room = @rooms[alien_new_room_name]
      puts "The alien moved #{direction} and went into #{@alien_current_room_name}"
    else
      puts "alien did not move from #{@alien_current_room} "
    end
  end
end
