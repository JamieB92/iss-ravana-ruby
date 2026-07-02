require_relative '../drone_alien_logic/drone_alien'
require_relative 'combat_narrative'

module Combat
  include CombatNarrative

  def detect_drone_alien_in_room
    @drone_alien_current_room_name == @current_room_name
  end
  
  def can_player_defeat_drone_alien
    if @player.backpack.length >= 2 && @drone_alien_health == 4
      @drone_alien_health = 3
      fight_encounter_1
    elsif @player.backpack.length >= 5 && @drone_alien_health == 3
      @drone_alien_health = 2
      fight_encounter_2
    elsif @player.backpack.length >= 7 && @drone_alien_health == 2
      @drone_alien_health = 1
      fight_encounter_3
    elsif @player.backpack.length >= 8 && @drone_alien_health == 1
      @drone_alien_health = 0
      @drone_alien_is_alive = false
      fight_encounter_4
    elsif @drone_alien_health == 0
      puts "The Drone's body lies cold on the deck of #{@drone_alien_current_room_name.upcase}. It is not getting back up."    
    else
      player_defeated
      @game_on = false
    end
  end

  def fight
    if detect_drone_alien_in_room
      can_player_defeat_drone_alien
    end
  end
end