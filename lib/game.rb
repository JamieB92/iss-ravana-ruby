require_relative 'player'
require_relative 'intro'
require 'yaml'
class Game
  def initialize
    Intro.intro_text
    player
    initialise_game
    @rooms = YAML.load_file(File.join(__dir__, '..', 'data', 'rooms.yaml'))
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

      return @game_on = false if input[0] == "quit"

      if input[0] == "go" && @current_room["exits"]
        move_room(input)
      end
    end
  end

  def enter_room
    if !@current_room["item"].nil?
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- OBJECT DETECTED: #{@current_room["item"].upcase}"
    else
      puts "\n  > ENTERING #{@current_room_name.upcase}"
      puts "    SCAN COMPLETE -- NO OBJECTS DETECTED"
    end
  end

  def move_room(input)
    if @current_room["exits"].key?(input[1])
      new_room_name = @current_room["exits"][input[1]]
      @current_room_name = new_room_name
      @current_room = @rooms[new_room_name]
      enter_room
    else
      puts "You can't go that way"
    end
  end
end