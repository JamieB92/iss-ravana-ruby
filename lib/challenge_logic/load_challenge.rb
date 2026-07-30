require_relative '../room_logic/room_movement'
require_relative '../challenge_logic/cryo_bay'

module LoadRoomChallenge
  include RoomMovement
  include CryoBayChallenge

  def get_room_puzzle_logic
    if @current_room_name == "cryo_bay"
      puts "#{@current_room_puzzle}"
      player_guess_cipher
    end
  end
end