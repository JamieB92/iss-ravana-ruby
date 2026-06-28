require_relative '../game_logic/game'
require_relative '../alien_logic/alien'

module Combat

  def detect_alien_in_room
    puts "#{@alien_health.inspect} - In detect_alien_in_room method"
    @alien_current_room_name == @current_room_name
  end
  
  def can_player_defeat_alien
    if @player.backpack.length >= 2 && @alien_health == 4
      @alien_health = 3
      puts "player defeats alien. The alien scuttles away"
    elsif @player.backpack.length >= 5 && @alien_health == 3
      @alien.health = 2
      puts "player defeats alien. The alien scuttles away"
    elsif @player.backpack.length >= 7 && @alien_health == 2
      @alien.health = 1   
      puts "player defeats alien. The alien scuttles away"
    elsif @player.backpack.length >= 8 && @alien_health == 1
      puts "player defeats alien and dies"
      @alien_health = 0
      @alien_is_alive = false      
    else
      puts "#{@alien_health.inspect} - In can_player_defeat else condition"
      puts "player was defeated by alien"
      @game_on = false
    end
  end

  def fight
    if detect_alien_in_room
      can_player_defeat_alien
    end
  end
end