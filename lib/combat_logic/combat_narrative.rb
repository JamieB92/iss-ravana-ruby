module CombatNarrative

  def fight_encounter_1
    puts ""
    puts "  > HOSTILE CONTACT -- #{@current_room_name.upcase}"
    puts "================================================================"
    puts ""
    puts "  The motion tracker screams before you see it."
    puts "  It steps out of the dark slowly -- no rush, no panic."
    sleep(3.5)
    puts "  Sleek. Black. Seven feet of something that should not exist."
    puts "  It tilts its head at you like it is deciding something."
    sleep(3.5)
    puts "  You do not wait for it to decide."
    puts "  You hit it with everything you have and it recoils --"
    puts "  not hurt, not yet, but surprised."
    sleep(3.5)
    puts "  It melts back into the corridor and is gone."
    puts "  The tracker goes quiet. It is still out there."
    puts ""
    puts "================================================================"
    puts ""
    sleep(3.5)
    clear_text
  end

  def fight_encounter_2
    puts ""
    puts "  > HOSTILE CONTACT -- #{@current_room_name.upcase}"
    puts "================================================================"
    puts ""
    puts "  It finds you again. This time it does not hesitate."
    puts "  It comes low and fast, claws sparking off the floor plates."
    sleep(3.5)
    puts "  You barely get your equipment up in time."
    puts "  The fight is short and savage. You take damage you will"
    puts "  feel for the rest of whatever time you have left."
    sleep(3.5)
    puts "  It breaks away when you land something solid --"
    puts "  a long shriek echoing down the corridor as it retreats."
    sleep(3.5)
    puts "  It is wounded. It is also angry."
    puts ""
    puts "================================================================"
    puts ""
    sleep(3.5)
    clear_text
  end

  def fight_encounter_3
    puts ""
    puts "  > HOSTILE CONTACT -- #{@current_room_name.upcase}"
    puts "================================================================"
    puts ""
    puts "  It comes out of the wall. Literally -- through a panel"
    puts "  you did not know could open. It is desperate now."
    sleep(3.5)
    puts "  Thrashing. Shrieking. All teeth and tail and blind fury."
    puts "  You stay on your feet. You do not know how."
    sleep(3.5)
    puts "  When it finally goes down it takes half the room with it."
    puts "  Something dark pools beneath it and eats into the floor."
    puts "  It is not moving. The tracker is silent."
    sleep(4.5)
    puts "  But somewhere deeper in the ship, something stirs."
    puts "  Something that was already awake. Already waiting."
    puts ""
    puts "================================================================"
    puts ""
    sleep(3.5)
    clear_text
  end

  def fight_encounter_4
    puts ""
    puts "  > HOSTILE ELIMINATED -- #{@current_room_name.upcase}"
    puts "================================================================"
    puts ""
    puts "  It comes for you one last time. No strategy. No patience."
    puts "  Just rage and the need to finish what it started."
    sleep(3.5)
    puts "  You are ready. You have been ready since the cargo hold."
    puts "  The fight destroys the room. When it is over you are"
    puts "  standing and it is not."
    sleep(3.5)
    puts "  Something dark eats through the floor where it fell."
    puts "  The motion tracker is silent for the first time since"
    puts "  you woke up. You almost believe it is over."
    sleep(4.5)
    puts "  Then MU/TH/UR speaks. One line. No context."
    puts ""
    sleep(3.5)
    puts "  SECONDARY BIOSIGN DETECTED. ORIGIN: ESCAPE BAY."
    puts "  MASS: EXTREME. CLASSIFICATION: UNKNOWN."
    puts ""
    sleep(3.5)
    puts "  The tracker was never tracking the Drone."
    puts "  It was tracking what came with it."
    puts ""
    puts "================================================================"
    puts ""
    sleep(3.5)
    clear_text
  end

  def player_defeated
    puts ""
    puts "  > WARNING -- INSUFFICIENT EQUIPMENT"
    puts "================================================================"
    puts ""
    puts "  You hear it before you see it."
    puts "  You are not ready. You were never going to be ready."
    sleep(3.5)
    puts "  The last thing you notice is how quiet the ship has become."
    sleep(4.5)
    puts "  MU/TH/UR logs the biosign for #{@player.name.upcase} as inactive."
    puts "  No further entries."
    puts ""
    puts "================================================================"
    puts "  SURVIVOR STATUS: DECEASED"
    puts "  SESSION TERMINATED"
    puts "================================================================"
    puts ""
  end

end
