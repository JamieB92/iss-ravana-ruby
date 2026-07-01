module Intro
  def self.clear_text
    print "\e[H\e[2J\e[3J"
    system("clear") || system("cls")
  end

  def self.intro_text
    puts ""
    puts "USCSS RAVANA -- WEYLAND-YUTANI CORPORATION"
    puts "MU/TH/UR 9000 MAINFRAME -- BOOT SEQUENCE INITIATED"
    puts "================================================================"
    sleep(1)
    puts "SYSTEM CHECK...................................... OK"
    sleep(1)
    puts "LIFE SUPPORT...................................... OK"
    sleep(1)
    puts "CRYO SYSTEMS...................................... FAULT"
    sleep(1)
    puts "CREW STATUS....................................... WARNING: 1 SURVIVOR"
    sleep(1)
    puts "HOSTILE LIFEFORMS DETECTED........................ CONFIRMED"
    puts "================================================================"
    puts ""
    sleep(4)

    clear_text
    puts "        ESCAPE FROM THE USCSS RAVANA"
    puts "        a survival horror text adventure"
    puts ""
    puts "================================================================"
    sleep(4)

    clear_text
    puts "SITUATION REPORT"
    puts "----------------------------------------------------------------"
    puts ""
    puts "  You wake alone in Cryo Bay. The emergency lights are red."
    puts "  The rest of the crew are dead. Something got to them first."
    puts ""
    sleep(3)
    puts "  The ship's escape pod requires a stasis code to launch."
    puts "  The code is in the Escape Bay -- guarded by whatever"
    puts "  tore through this crew like they were nothing."
    puts ""
    sleep(3)
    puts "  Collect everything you can. You are going to need it."
    puts ""
    puts "================================================================"
    sleep(4)

    clear_text
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
    sleep(7)

    clear_text
    puts "  WARNING: HOSTILE ENTITIES CONFIRMED ABOARD THIS VESSEL."
    puts "  DO NOT ENGAGE WITHOUT SUFFICIENT EQUIPMENT."
    puts "  COMPANY POLICY: ALL OTHER PRIORITIES RESCINDED."
    puts "================================================================"
    puts ""
    sleep(3)
    puts "  MU/TH/UR SIGNING OFF. GOOD LUCK. YOU WILL NEED IT."
    puts ""
    puts "  > "
  end
end