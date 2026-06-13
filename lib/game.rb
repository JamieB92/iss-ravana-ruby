require_relative 'player'
require 'yaml'
class Game
  def initialize
    intro
    player
    game_state
    @rooms = YAML.load_file(File.join(__dir__, '..', 'data', 'rooms.yaml'))
    start_game

  end

  def intro
  puts ""
  puts "USCSS RAVANA -- WEYLAND-YUTANI CORPORATION"
  puts "MU/TH/UR 9000 MAINFRAME -- BOOT SEQUENCE INITIATED"
  puts "================================================================"
  puts "SYSTEM CHECK...................................... OK"
  puts "LIFE SUPPORT...................................... OK"
  puts "CRYO SYSTEMS...................................... FAULT"
  puts "CREW STATUS....................................... WARNING: 1 SURVIVOR"
  puts "HOSTILE LIFEFORMS DETECTED........................ CONFIRMED"
  puts "================================================================"
  puts ""
  puts "        ESCAPE FROM THE USCSS RAVANA"
  puts "        a survival horror text adventure"
  puts ""
  puts "================================================================"
  puts "SITUATION REPORT"
  puts "----------------------------------------------------------------"
  puts ""
  puts "  You wake alone in Cryo Bay. The emergency lights are red."
  puts "  The rest of the crew are dead. Something got to them first."
  puts ""
  puts "  The ship's escape pod requires a stasis code to launch."
  puts "  The code is in the Escape Bay -- guarded by whatever"
  puts "  tore through this crew like they were nothing."
  puts ""
  puts "  Collect everything you can. You are going to need it."
  puts ""
  puts "================================================================"
  puts "TERMINAL COMMANDS"
  puts "----------------------------------------------------------------"
  puts ""
  puts "  NAVIGATION    go <direction>    north / south / east / west"
  puts "  PICK UP       get <item>        e.g. get pulse_rifle"
  puts "  INVENTORY     inventory         list items you are carrying"
  puts "  LOOK          look              describe current room"
  puts "  HELP          help              show this command list"
  puts "  RESTART       restart           restart from cryo bay"
  puts "  QUIT          quit              terminate session"
  puts ""
  puts "================================================================"
  puts "  WARNING: HOSTILE ENTITIES CONFIRMED ABOARD THIS VESSEL."
  puts "  DO NOT ENGAGE WITHOUT SUFFICIENT EQUIPMENT."
  puts "  COMPANY POLICY: ALL OTHER PRIORITIES RESCINDED."
  puts "================================================================"
  puts ""
  puts "  MU/TH/UR SIGNING OFF. GOOD LUCK. YOU WILL NEED IT."
  puts ""
  puts "  > "
  end

  def player_input
    gets.chomp.downcase
  end

  def player
    puts "\n  > SURVIVOR IDENTIFICATION REQUIRED"
    puts "    Enter your name, soldier: "
    player = player_input
    @player = Player.new(player)
  end

  def game_state
    @game_state = false
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
    while @game_state == false
      puts "What is your next move?"
      return @game_state = true if player_input == "quit"
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
end