require_relative '../classes/player'
require_relative '../modules/intro'
require_relative '../modules/room_movement'
require 'yaml'

class Game
  include RoomMovement
  include GetRoomItem
  
  def initialize
    Intro.intro_text
    player
    initialise_game
    @rooms = YAML.load_file(File.join(__dir__, '..', '..', 'data', 'rooms.yaml'))
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

  def initialise_game
    @game_on = true
  end

  def start_game
    @current_room_name = "cryo_bay"
    @current_room = @rooms["cryo_bay"]

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