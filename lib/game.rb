require_relative 'player'
require_relative 'room_map'
class Game
  def initialize
    intro
    player
    start_game
  end

  def intro
    puts "###############################################################"
    puts "#            Welcome to Escape from the ISS Ravana            #"
    puts "#-------------------------------------------------------------#"
    puts "#                                                             #"
    puts "#     Escape from ISS Ravana is a text based survival game    #"
    puts "#     where the aim of the game is to collect all the items   #"
    puts "#                and escape from the ship.                    #"
    puts "#     But keep your wits about you as you explore the ship    #"
    puts "#            as you may not be the only one left!             #"
    puts "#                                                             #"
    puts "###############################################################"
    puts "#                      Instructions                           #"
    puts "#-------------------------------------------------------------#"
    puts "#                                                             #"
    puts "#                     Type Commands :                         #"
    puts "#        To move between rooms type go and the direction:     #"
    puts "#               'Go' - 'Left', 'Right', 'Up', 'Down'          #"
    puts "#                                                             #"
    puts "#                To get and item in a room type:              #"
    puts "#               'Get' and the items name 'Spanner'            #"
    puts "#                                                             #"
    puts "#               Type 'Help' to see the games controls         #"
    puts "#               Type 'Restart' to Restart the game            #"
    puts "#                 Type 'Exit' to exit the game                #"
    puts "#                                                             #"
    puts "###############################################################"
  end

  def player
    puts "What is your name?"
    player = gets.chomp
    @player = Player.new(player)
  end

  def start_game
    @current_room_name = :cryo
    @current_room = ROOM_MAP[:cryo]

    puts "Welcome #{@player.name} to the ISS Ravana, you find yourself in the #{@current_room_name} room."
    enter_room
  end

  def enter_room
    if !@current_room[:item].nil?
      puts "You enter #{@current_room_name.to_s.capitalize} and see #{@current_room[:item]} in the room."
    else
      puts "You enter #{@current_room_name.to_s.capitalize} and see nothing in the room."
    end
  end
end