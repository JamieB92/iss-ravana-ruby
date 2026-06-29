require_relative '../alien_logic/alien'
require_relative 'combat_narrative'

module Combat
  include CombatNarrative

  def detect_alien_in_room
    @alien_current_room_name == @current_room_name
  end
  
  def can_player_defeat_alien
    if @player.backpack.length >= 2 && @alien_health == 4
      @alien_health = 3
      fight_encounter_1
    elsif @player.backpack.length >= 5 && @alien_health == 3
      @alien_health = 2
      fight_encounter_2
    elsif @player.backpack.length >= 7 && @alien_health == 2
      @alien_health = 1
      fight_encounter_3
    elsif @player.backpack.length >= 8 && @alien_health == 1
      @alien_health = 0
      @alien_is_alive = false
      fight_encounter_4
    else
      player_defeated
      @game_on = false
    end
  end

  def fight
    if detect_alien_in_room
      can_player_defeat_alien
    end
  end
end