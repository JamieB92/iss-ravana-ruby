# 🛸 ESCAPE FROM THE USCSS RAVANA

> **MU/TH/UR 9000 MAINFRAME — BOOT SEQUENCE INITIATED**
> SYSTEM CHECK ...... OK · LIFE SUPPORT ...... OK · CRYO SYSTEMS ...... FAULT
> CREW STATUS ...... WARNING: 1 SURVIVOR · HOSTILE LIFEFORMS DETECTED ...... CONFIRMED

A survival-horror text adventure written in pure Ruby, built as an object-oriented reimagining of the original Python terminal game [`portfolio-project-three`](https://github.com/JamieB92/portfolio-project-three). No gems. No mercy. Just you, a dying ship, and something in the walls.

---

## 📡 SITUATION REPORT

You wake alone in the **Cryo Bay**. The emergency lights are red. The rest of the crew are dead — something got to them first.

The ship's escape pod requires a **stasis code** to launch. That code is in the **Escape Bay**, guarded by whatever tore through this crew like they were nothing.

Collect everything you can. You are going to need it.

---

## 🕹️ TERMINAL COMMANDS

| Command | Example | Effect |
|---|---|---|
| `go <direction>` | `go north` | Move between rooms (`north` / `south` / `east` / `west`) |
| `get <item>` | `get pulse_rifle` | Pick up the item detected in your current room |
| `exit` | `exit` | Terminate the session |

---

## 🗺️ SHIP LAYOUT

15 rooms, spanning from the frozen quiet of the Cryo Bay to the final stand at the Escape Bay:

```
              cargo_hold ─── weapons_locker
                   │
armory        hypersleep_corridor ─── cryo_bay
   │               │              │
mess_hall ─────────┘        maintenance_tunnels
   │                                │
server_room                   engine_room ─── quarantine_zone
   │                            │       │
comms_array                research_lab   captains_quarters
   │                                          │
observation_deck                          air_lock ─── bridge ─── escape_bay
```

Each room hides an item — from a `pulse_rifle` in the Cryo Bay to a `flamethrower` in the Weapons Locker and a `detonator` in the Captain's Quarters. Reach the Escape Bay and the Xenomorph Queen drops the `stasis_pod_code` — assuming you survive her.

---

## 👽 THREATS ABOARD

| Designation | Field Report |
|---|---|
| **Facehugger** | A pale, spider-like creature drops from the ceiling. You hear it before you see it. |
| **Chestburster** | A wet, shrieking creature bursts from the shadows. It moves faster than anything its size should. |
| **Xenomorph Drone** | A sleek, black form steps out from behind the drive housing. It tilts its head — and charges. |
| **Xenomorph Queen** | She fills the room. Twelve feet of carapace and claws, and she is between you and the only way out. |

Combat against the Drone is fought in **four escalating encounters**, gated by how well-equipped you are — the more your backpack holds, the more of the fight you survive.

---

## 🏗️ BUILT WITH

- **Ruby** `4.0.5`
- Plain Ruby standard library only — `YAML` for room/alien data, no external gems
- Object-oriented design: classes for `Game`, `Player`, `Room`, `DroneAlien`
- Modules mixed into `Game` for shared behaviour: `RoomMovement`, `GetRoomItem`, `Combat`, `DroneAlienMovement`, `CombatNarrative`
- Room and alien data externalised into `data/*.yaml`, loaded at runtime

---

## 📂 PROJECT STRUCTURE

```
iss-ravana-ruby/
├── bin/
│   └── run.rb                     # entry point
├── data/
│   ├── rooms.yaml                 # ship map, exits, items
│   └── aliens.yaml                # alien names + descriptions
├── lib/
│   ├── game_logic/
│   │   ├── game.rb                # main game loop
│   │   ├── intro.rb                # boot sequence / mission briefing
│   │   └── ascii_art.rb           # ship + alien ASCII art
│   ├── player_logic/
│   │   └── player.rb              # player state + backpack
│   ├── room_logic/
│   │   ├── room.rb
│   │   ├── room_movement.rb       # navigation between rooms
│   │   └── get_room_item.rb       # item pickup
│   ├── drone_alien_logic/
│   │   ├── drone_alien.rb
│   │   └── drone_alien_movement.rb
│   └── combat_logic/
│       ├── combat.rb              # encounter gating logic
│       └── combat_narrative.rb    # fight text
├── Gemfile
├── .ruby-version
└── README.md
```

---

## 🚀 RUNNING THE GAME

```bash
ruby bin/run.rb
```

Enter your name when prompted, then use `go`, `get`, and `exit` to navigate the Ravana. Good luck. You will need it.

---