require_relative '../player_logic/player'
require_relative 'intro'
require_relative '../room_logic/room_movement'
require_relative '../alien_logic/alien'
require 'yaml'

class Game
  include RoomMovement
  include GetRoomItem
  
  def initialize
    Intro.intro_text
    player
    initialise_game
    @rooms = YAML.load_file(File.join(__dir__, '..', '..', 'data', 'rooms.yaml'))
    @aliens = YAML.load_file(File.join(__dir__, '..', '..', 'data', 'aliens.yaml'))
    alien
    start_game
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

  def alien
    @alien = Alien.new("Facehugger", @aliens["Facehugger"]["items_required"], @aliens["Facehugger"]["description"])
  end

  def aliens_health
    @alien_health = 4
    @alien_is_alive = true
  end

  def initialise_game
    @game_on = true
  end

  def start_game
    @current_room_name = "cryo_bay"
    @current_room = @rooms["cryo_bay"]

    @alien_current_room_name = "cryo_bay"
    @alien_current_room = @rooms["cryo_bay"]

    puts "\n  > CRYO SEQUENCE TERMINATED"
    puts "    Survivor designation: #{@player.name.upcase}"
    puts "    Current location: #{@current_room_name.upcase}"
    enter_room
    game_loop
  end

  def game_loop
    while @game_on == true
      puts "What is your next move?"
      input = player_input.downcase.split

      if input[0] == "go"
        move_room(input)
      elsif input[0] == "exit"
        @game_on = false
      elsif input[0] == "get"
        pick_up_item(input)
      else
        puts "Computer says no..... please use a correct input"
      end

      puts " Backpack: #{@player.backpack}"
    end
  end
end