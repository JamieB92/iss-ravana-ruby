require_relative '../room_logic/room'
require_relative 'drone_alien'
require_relative '../game_logic/game'

module DroneAlienMovement
  def move_room_drone_alien
    does_drone_alien_move = [true, false]
    does_it_move = does_drone_alien_move.sample

    if does_it_move == true && @drone_alien_health > 0
      direction = @drone_alien_current_room["exits"].keys.sample
      drone_alien_new_room_name = @drone_alien_current_room["exits"][direction]
      @drone_alien_current_room_name = drone_alien_new_room_name
      @drone_alien_current_room = @rooms[drone_alien_new_room_name]
      puts "The alien moved #{direction} and went into #{@drone_alien_current_room_name}"
    else
      puts "alien did not move from #{@drone_alien_current_room_name} "
    end
  end
end
