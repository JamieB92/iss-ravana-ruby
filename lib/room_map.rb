ROOM_MAP = {
    cryo: { 
      exits: {
        left: :lower, right: :upper
      }, 
      item: 'food', 
      alien: nil
    },
    lower: {
      exits: {
        left: :engine, right: :cryo
      }, 
      item: 'water', 
      alien: nil},
    engine: {
      exits: {
        right: :lower, up: :landing
      }, 
      item: 'magazine', 
      alien: nil
    },
    landing: {
      exits: {
        up: :broken_escape_pod, down: :engine}, 
      item: nil, 
      alien: nil
    },
    broken_escape_pod: {
      exits: {
        down: :landing
      }, 
      item: 'torch', 
      alien: nil
    },
    recreation: {
      exits: {
        right: :medical, up: :escape_pod}, 
      item: 'bun', 
      alien: nil
    },
    escape_pod: {
      exits: {
        down: :recreation, escape: :use_pod}, 
      item: nil, 
      alien: nil
    },
    medical: {
      exits: {
        left: :recreation, right: :it
      }, 
      item: 'bandages', 
      alien: nil
    },
    it: {
      exits: {
        left: :medical, down: :upper
      }, 
      item: 'grenade', 
      alien: nil
    },
    upper: {
      exits: {
        left: :cryo, right: :bridge, up: :it, down: :crew
      }, 
      item: nil, 
      alien: nil
    },
    crew: {
      exits: {
        up: :upper, left: :armory
      }, 
      item: 'armour', 
      alien: nil
    },
    armory: { 
      exits: {
        right: :crew
      }, 
      item: 'bullets', 
      alien: nil 
    },
    bridge: {
      exits: {
        left: :upper, intruder: :xenos
      }, 
      item: 'pin', 
      alien: nil
    }
}