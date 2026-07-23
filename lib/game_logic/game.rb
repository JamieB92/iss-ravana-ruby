require_relative '../player_logic/player'
require_relative 'intro'
require_relative '../room_logic/room_movement'
require_relative '../drone_alien_logic/drone_alien'
require 'yaml'

class Game
  include RoomMovement
  include GetRoomItem
  include Combat
  
  def initialize
    Intro.intro_text
    player
    initialise_game
    @rooms = YAML.load_file(File.join(__dir__, '..', '..', 'data', 'rooms.yaml'))
    @aliens = YAML.load_file(File.join(__dir__, '..', '..', 'data', 'aliens.yaml'))
    drone_alien
    start_game
  end

  def clear_text
    print "\e[H\e[2J\e[3J"
    @clear = system("clear") || system("cls")
  end

  def player_input
    gets.chomp
  end

  def player
    puts "\n  > SURVIVOR IDENTIFICATION REQUIRED"
    puts "    Enter your name, soldier: "
    player = player_input
    @player = Player.new(player)
  end

  def drone_alien
    @drone_alien = DroneAlien.new("Xenomorph_Drone", @aliens["Xenomorph_Drone"]["description"])
    @drone_alien_health = 4
  end

  def initialise_game
    @game_on = true
  end

  def start_game
    @current_room_name = "cryo_bay"
    @current_room = @rooms["cryo_bay"]

    @drone_alien_current_room_name = "quarantine_zone"
    @drone_alien_current_room = @rooms["quarantine_zone"]

    clear_text
    puts "\n  > CRYO SEQUENCE TERMINATED"
    puts "    Survivor designation: #{@player.name.upcase}"
    puts "    Current location: #{@current_room_name}"
    sleep(2)
    enter_room
    game_loop
  end

  def game_loop
    while @game_on == true
      puts "    Backpack: #{@player.backpack}"
      puts "                                 "
      puts "    Current location: #{@current_room_name.upcase}"
      puts "    What is your next move?"
      input = player_input.downcase.split

      if input[0] == "go"
        move_room(input)
      elsif input[0] == "exit"
        @game_on = false
      elsif input[0] == "get"
        pick_up_item(input)
      elsif input[0] == "restart"
        restart_game
      else
        clear_text
        puts "Computer says no..... please use a correct input"
      end
    end
  end

  def restart_game
      puts "Do you want to restart the game?"
      puts "Yes or No?"

      input = player_input.downcase.split
      if input[0] == "yes"
        clear_text
        @player.backpack = []
        @drone_alien_health = 4
        start_game
      elsif input[0] == "no"
        @game_on = false
      else
        puts "not the correct input"
      end
      clear_text
  end
end