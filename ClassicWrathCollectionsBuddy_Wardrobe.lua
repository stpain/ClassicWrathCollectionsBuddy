local name, addon = ...;

local Database = addon.Database;

local raceFileStringToId = {
    Human = 1,
    Orc = 2,
    Dwarf = 3,
    NightElf = 4,
    Scourge = 5,
    Tauren = 6,
    Gnome = 7,
    Troll = 8,
    Goblin = 9,
    BloodElf = 10,
    Draenei = 11,

    Worgen = 22,
    Pandaren = 24,
    PandarenAlliance = 25,
    PandarenHorde = 26,
}


local modelRaceOffsets = {
    Human = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.5,0,0.2},
            zoom = 0.5,
            rotation = 0.9,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.8},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.5},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.6,0,0.2},
            zoom = 0.52,
            rotation = 0.9,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {0.3,0,-0.15},
            zoom = 0.6,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    Dwarf = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.75,0,0.25},
            zoom = 0.3,
            rotation = 1.1,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.6},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.4},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.75,0,0.25},
            zoom = 0.3,
            rotation = 1.1,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {-0.1,0,-0.1},
            zoom = 0.6,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    Gnome = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.75,0,0.25},
            zoom = 0.3,
            rotation = 1.1,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.3},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.3},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.75,0,0.15},
            zoom = 0.3,
            rotation = 1.1,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {-0.1,0,-0.0},
            zoom = 0.65,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.1},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    NightElf = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.5,0,0.2},
            zoom = 0.5,
            rotation = 0.9,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.8},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.5},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.6,0,0.2},
            zoom = 0.52,
            rotation = 0.9,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {0.4,0,-0.15},
            zoom = 0.55,
            rotation = 0.5,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    Draenei = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.3,0,0.2},
            zoom = 0.7,
            rotation = 0.9,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.9},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.6},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.4,0,0.2},
            zoom = 0.7,
            rotation = 0.9,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {0.3,0,-0.15},
            zoom = 0.7,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.6,0,0.25},
            zoom = 0.6,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.3,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },


    Orc = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.5,0,0.2},
            zoom = 0.5,
            rotation = 0.9,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.8},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.5},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.6,0,0.2},
            zoom = 0.52,
            rotation = 0.9,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {0.3,0,-0.15},
            zoom = 0.6,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    Scourge = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0,0,0.3},
            zoom = 0.7,
            rotation = -1.0,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.8},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.6},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0,0,0.3},
            zoom = 0.7,
            rotation = -1.0,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {-0.1,0,-0.1},
            zoom = 0.6,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.2,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    Troll = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.75,0,0.25},
            zoom = 0.5,
            rotation = 1.1,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.9},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.6},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.75,0,0.15},
            zoom = 0.5,
            rotation = 1.1,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.5},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {-0.1,0,-0.0},
            zoom = 0.7,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.3},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.1},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.3},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.3},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    BloodElf = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.5,0,0.1},
            zoom = 0.7,
            rotation = 0.9,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.9},
            zoom = 0.75,
            rotation = -0.5,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.52},
            zoom = 0.75,
            rotation = -0.5,
        },
        INVTYPE_WRIST = {
            pos = {0.5,0,0.0},
            zoom = 0.7,
            rotation = 0.9,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = -0.5,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {0.4,0,-0.15},
            zoom = 0.6,
            rotation = 0.5,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.2,0,0.2},
            zoom = 0.45,
            rotation = -1.2,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.15,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
    Tauren = {
        INVTYPE_CHEST = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HEAD = {
            pos = {0,0,-0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_HAND = {
            pos = {0.3,0,0.2},
            zoom = 0.6,
            rotation = 0.9,
        },
        INVTYPE_FEET = {
            pos = {0,0,0.7},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_LEGS = {
            pos = {0,0,0.5},
            zoom = 0.75,
            rotation = 0.0,
        },
        INVTYPE_WRIST = {
            pos = {0.4,0,0.2},
            zoom = 0.6,
            rotation = 0.9,
        },
        INVTYPE_WAIST = {
            pos = {0,0,0.2},
            zoom = 0.8,
            rotation = 0.0,
        },
        INVTYPE_ROBE = {
            pos = {0,0,0.1},
            zoom = 0.45,
            rotation = 0.0,
        },
        INVTYPE_SHOULDER = {
            pos = {0.3,0,-0.15},
            zoom = 0.5,
            rotation = -1.1,
        },
        INVTYPE_BODY = {
            pos = {0,0,0.1},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_SHIELD = {
            pos = {0.6,0,0.25},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_RANGED = {
            pos = {0.2,0,0.2},
            zoom = 0.2,
            rotation = -1.6,
        },
        INVTYPE_CLOAK = {
            pos = {0,0,0.15},
            zoom = 0.65,
            rotation = 2.9,
        },
        INVTYPE_TABARD = {
            pos = {0,0,0.15},
            zoom = 0.85,
            rotation = 0.0,
        },
        INVTYPE_MAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_SECONDARYHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_RANGEDRIGHT = {
            pos = {0,0,0.4},
            zoom = 0.4,
            rotation = 0.6,
        },
        INVTYPE_WEAPONOFFHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = -0.7,
        },
        INVTYPE_WEAPONMAINHAND = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
        INVTYPE_2HWEAPON = {
            pos = {0,0,0.0},
            zoom = 0.3,
            rotation = 0.8,
        },
        INVTYPE_WEAPON = {
            pos = {0,0,0.4},
            zoom = 0.45,
            rotation = 0.6,
        },
    },
}

local equipLocationWeapons = {
    [0] = "INVTYPE_WEAPON",
    [1] = "INVTYPE_2HWEAPON",
    [2] = "INVTYPE_RANGED",
    [3] = "INVTYPE_RANGEDRIGHT",
    [4] = "INVTYPE_WEAPON",
    [5] = "INVTYPE_2HWEAPON",
    [6] = "INVTYPE_2HWEAPON",
    [7] = "INVTYPE_WEAPON",
    [8] = "INVTYPE_2HWEAPON",
    [9] = "INVTYPE_WEAPON",
    [10] = "INVTYPE_2HWEAPON",
    [11] = "INVTYPE_WEAPON",
    [12] = "INVTYPE_WEAPON",
    [13] = "INVTYPE_WEAPON",
    [14] = "INVTYPE_WEAPON",
    [15] = "INVTYPE_WEAPON",
    [16] = "INVTYPE_WEAPON",
    [17] = "INVTYPE_WEAPON",
    [18] = "INVTYPE_RANGED",
    [19] = "INVTYPE_WEAPON",
    [20] = "INVTYPE_WEAPON",
}

local classIdArmorType = {
    [1] = 4, --warrior
    [2] = 4, --paladin
    [3] = 3, --hunter
    [4] = 2, --rogue
    [5] = 1, --priest
    [6] = 4, --dk
    [7] = 3, --shaman
    [8] = 1, --mage
    [9] = 1, --warlocki
    [10] = 2, --monk
    [11] = 2, --druid
    [12] = 2, --dh
}






AppearanceUtil = {}

function AppearanceUtil:SetClass(classID)
    self.classID = classID;
end

function AppearanceUtil:GetAppearancesForSlot(invSlot)
    local t = {}
    if addon.transmogItemData and addon.transmogItemData[invSlot] then
        for appearanceID, items in pairs(addon.transmogItemData[invSlot]) do
            if items[1] and (items[1].subClassID == classIdArmorType[self.classID]) then
                local info = {}
                info.appearanceID = appearanceID
                info.matchingAppearances = {}
                table.sort(items, function(a, b)
                    return a.itemID > b.itemID
                end)
    
                for k, item in ipairs(items) do
                    if k == 1 then
                        info.itemID = item.itemID
                    end
                    table.insert(info.matchingAppearances, item)
                end
    
                table.insert(t, info)
            end
        end
    end
    return t;
end















local spacingNoSmallButton = 2;
local spacingWithSmallButton = 12;
local defaultSectionSpacing = 24;
local shorterSectionSpacing = 19;

ClassicWrathCollectionsBuddy_WardrobeMixin = {}

function ClassicWrathCollectionsBuddy_WardrobeMixin:CreateSlotButtons()
	local slots = { "head", "shoulder", "cloak", "chest", "robe", spacingWithSmallButton, "tabard", "wrist", "hand", "waist", "legs", "feet", defaultSectionSpacing, "mainhand", "shield" };
	local parentFrame = self.SlotsFrame;
	local lastButton;
	local xOffset = spacingNoSmallButton;
	for i = 1, #slots do
		local value = tonumber(slots[i]);
		if ( value ) then
			-- this is a spacer
			xOffset = value;
		else
			local slotString = slots[i];
			local button = CreateFrame("BUTTON", nil, parentFrame, "WardrobeSlotButtonTemplate");
            if slotString == "shield" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-secondaryhand", true);
            elseif slotString == "hand" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-hands", true);
            elseif slotString == "cloak" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-back", true);
            elseif slotString == "secondaryhand" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-mainhand", true);
            elseif slotString == "robe" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-chest", true);
            else
                button.NormalTexture:SetAtlas("transmog-nav-slot-"..slotString, true);
            end
			if ( lastButton ) then
				button:SetPoint("LEFT", lastButton, "RIGHT", xOffset, 0);
			else
				button:SetPoint("TOPLEFT");
			end

            button.equipLocation = string.format("INVTYPE_%s", slotString:upper())

            button:SetScript("OnClick", function()
                if addon.transmogItemData and addon.transmogItemData[button.equipLocation] then
                    self.filteredEquipLocation = button.equipLocation
                    self:LoadItems(addon.transmogItemData[button.equipLocation])
                    self.WeaponDropDown:Hide()
                else
                    if button.equipLocation == "INVTYPE_MAINHAND" then
                        self.WeaponDropDown:Show()
                    end
                end
            end)

            button:SetScript("OnEnter", function(b)
                GameTooltip:SetOwner(b, "ANCHOR_TOPRIGHT")
                GameTooltip:AddLine(slotString)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function(b)
                GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
            end)

			xOffset = spacingNoSmallButton;
			lastButton = button;
		end
	end
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:Database_OnProfileSelected(profile)
    self.characterProfile = profile;
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:CWC_OnTransmogAppearanceAdded()

    if self:IsVisible() then

        if self.items then
            self:LoadItems(self.items)
        end

        if self.loadWeaponSubClassID then
            self:LoadWeapons(self.loadWeaponSubClassID)
        end

    end
end

function ClassicWrathCollectionsBuddy_WardrobeMixin:OnLoad()

    addon:RegisterCallback("Database_OnProfileSelected", self.Database_OnProfileSelected, self)
    addon:RegisterCallback("CWC_OnTransmogAppearanceAdded", self.CWC_OnTransmogAppearanceAdded, self)

	self:CreateSlotButtons();
	self.BGCornerTopLeft:Hide();
	self.BGCornerTopRight:Hide();
	self.HiddenModel:SetKeepModelOnHide(true);


	self.NUM_ROWS = 3;
	self.NUM_COLS = 6;
	self.PAGE_SIZE = self.NUM_ROWS * self.NUM_COLS;

    for k, model in ipairs(self.Models) do
        model:Show()
        model:SetUnit("player")
    end

    self.items = {}
    self.filteredItems = {}

    UIDropDownMenu_SetWidth(self.WeaponDropDown, 160)
    UIDropDownMenu_Initialize(self.WeaponDropDown, function(CwcWardrobeFrameWeaponDropDown)
        for i = 0, 20 do
            if i ~= 11 and i ~= 12 and i ~= 9 and i ~= 17 and i ~= 14 then
                local info = UIDropDownMenu_CreateInfo()
                local name, isArmorType = GetItemSubClassInfo(2, i)
                info.text = name
                info.func = function()
                    UIDropDownMenu_SetText(self.WeaponDropDown, name)
                    self:LoadWeapons(i)
                end
                UIDropDownMenu_AddButton(info)
            end
        end
    end)

    --keep this for any potential needs

    -- ClassicWrathCollectionsBuddy_Character = {}
    -- local index = 1;
    -- local numToProcess = #addon.transmogData;
    -- C_Timer.NewTicker(0.1, function()

    --     local info = addon.transmogData[index]
                
    --         local itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subclassID = GetItemInfoInstant(info[2])

    --         if classID == 4 or classID == 2 then
    
    --             if type(classID) == "number" and type(subclassID) == "number" and type(itemEquipLoc) == "string" then

    --                 local item = Item:CreateFromItemID(info[2])
    --                 if not item:IsItemEmpty() then
    --                     item:ContinueOnItemLoad(function()
    --                         if not ClassicWrathCollectionsBuddy_Character[itemEquipLoc] then
    --                             ClassicWrathCollectionsBuddy_Character[itemEquipLoc] = {}
    --                         end
    --                         if not ClassicWrathCollectionsBuddy_Character[itemEquipLoc][info[4]] then
    --                             ClassicWrathCollectionsBuddy_Character[itemEquipLoc][info[4]] = {}
    --                         end
    --                         table.insert(ClassicWrathCollectionsBuddy_Character[itemEquipLoc][info[4]], {
    --                             classID = classID,
    --                             subClassID = subclassID,
    --                             itemID = info[2],
    --                             itemLink = item:GetItemLink()
    --                         })

    --                         print(string.format("processed %d of %d", index, numToProcess))
    --                     end)
    --                 end
    --             end

    --         end

    --         index = index + 1;
    
    --     self.items = ClassicWrathCollectionsBuddy_Character
    -- end, numToProcess)

end


function ClassicWrathCollectionsBuddy_WardrobeMixin:LoadWeapons(subClassID)

    self.loadWeaponSubClassID = subClassID;
    self.items = nil

    self.filteredItems = {}
    local weapons = {"INVTYPE_WEAPONMAINHAND", "INVTYPE_WEAPON", "INVTYPE_2HWEAPON", "INVTYPE_WEAPONOFFHAND", "INVTYPE_RANGEDRIGHT", "INVTYPE_RANGED"}
    for k, v in ipairs(weapons) do
        for appearanceID, mogs in pairs(addon.transmogItemData[v]) do

            local isKnown = 0
            local sharedItems = Database:GetItemIDsForAppearanceID(v, appearanceID)
            for k, itemID in ipairs(sharedItems) do
                isKnown = Database:IsItemKnown(itemID)
                if isKnown == 1 then
                    break
                end
            end
    
            if (mogs[1].classID == 2) and (mogs[1].subClassID == subClassID) then
                table.insert(self.filteredItems, {
                    itemID = mogs[1].itemID,
                    appearanceID = appearanceID,
                    alternativeItems = mogs,
                    isKnown = isKnown
                })
            end
        end
    end

    --best guess for new to old ?
    table.sort(self.filteredItems, function(a, b)
        if a.isKnown == b.isKnown then
            return a.itemID > b.itemID;
        else
            return a.isKnown > b.isKnown
        end
    end)

    self.PagingFrame:SetCurrentPage(1)

    self.PagingFrame:SetMaxPages(ceil(#self.filteredItems / self.PAGE_SIZE));

    self.filteredEquipLocation = equipLocationWeapons[subClassID]

    self:OnPageChanged()
end
function ClassicWrathCollectionsBuddy_WardrobeMixin:LoadItems(items)

    self.items = items
    self.loadWeaponSubClassID = nil

    local itemClassID;
    local itemSubClassID;

    if self.filteredEquipLocation == "INVTYPE_MAINHAND" then
        itemClassID = 2

    elseif self.filteredEquipLocation == "INVTYPE_SHIELD" then
        itemClassID = 4
        itemSubClassID = 6

    elseif self.filteredEquipLocation == "INVTYPE_TABARD" then
        itemClassID = 4
        itemSubClassID = 0

    elseif self.filteredEquipLocation == "INVTYPE_CLOAK" then
        itemClassID = 4
        itemSubClassID = 1

    else
        local classID = self.characterProfile.classID
        if classID then
            itemSubClassID = classIdArmorType[classID]
            itemClassID = 4;
            
        end
    end

    if itemClassID and itemSubClassID then
        
        self.filteredItems = {}
        for appearanceID, mogs in pairs(items) do

            local isKnown = 0
            local sharedItems = Database:GetItemIDsForAppearanceID(self.filteredEquipLocation, appearanceID)
            for k, itemID in ipairs(sharedItems) do
                isKnown = Database:IsItemKnown(itemID)
                if isKnown == 1 then
                    break
                end
            end

            if (mogs[1].classID == itemClassID) and (mogs[1].subClassID == itemSubClassID) then
                table.insert(self.filteredItems, {
                    itemID = mogs[1].itemID,
                    appearanceID = appearanceID,
                    alternativeItems = mogs,
                    isKnown = isKnown
                })
            end
        end

        --best guess for new to old ?
        table.sort(self.filteredItems, function(a, b)
            if a.isKnown == b.isKnown then
                return a.itemID > b.itemID;
            else
                return a.isKnown > b.isKnown
            end
        end)
    
        self.PagingFrame:SetCurrentPage(1)
    
        self.PagingFrame:SetMaxPages(ceil(#self.filteredItems / self.PAGE_SIZE));
    
        self:OnPageChanged()
    end
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:OnPageChanged()

    if not self.characterProfile then
        return
    end
    if not self.characterProfile.raceName then
        return
    end

    local i = 1
    C_Timer.NewTicker(0.01, function()
        local model = self.Models[i]
        local index = i + (self.PagingFrame:GetCurrentPage() - 1) * self.PAGE_SIZE

        if self.filteredItems[index] and modelRaceOffsets[self.characterProfile.raceName][self.filteredEquipLocation] then

            local modelSetup = modelRaceOffsets[self.characterProfile.raceName][self.filteredEquipLocation]
            model:Show()
            model:Undress()
            --C_Timer.After(0.2, function()
                model:SetRotation(modelSetup.rotation);
                model:SetPosition(modelSetup.pos[1], modelSetup.pos[2], modelSetup.pos[3]);
                model:SetPortraitZoom(modelSetup.zoom);
                model:TryOn(string.format("item:%d", self.filteredItems[index].itemID))

                if self.filteredItems[index].isKnown == 1 then
                    model.Border:SetAtlas("transmog-wardrobe-border-collected")
                else
                    model.Border:SetAtlas("transmog-wardrobe-border-uncollected")
                end

                local alternatives = {}
                for k, v in ipairs(self.filteredItems[index].alternativeItems) do
                    if self.filteredItems[index].isKnown == 1 then
                        table.insert(alternatives, {
                            itemID = v.itemID,
                            collected = true,
                            itemLink = v.itemLink,
                        })
                    else
                        table.insert(alternatives, {
                            itemID = v.itemID,
                            collected = false,
                            itemLink = v.itemLink,
                        })
                    end
                end

                model.alternativeItems = alternatives
            --end) 
        else
            model:Hide()
        end
        i = i + 1
    end, self.PAGE_SIZE)

    -- for i = 1, self.PAGE_SIZE do
    --     local model = self.Models[i]
    --     local index = i + (self.PagingFrame:GetCurrentPage() - 1) * self.PAGE_SIZE

    --     if self.filteredItems[index] and equipLocationPositons[self.filteredEquipLocation] then

    --         local modelSetup = equipLocationPositons[self.filteredEquipLocation]
    --         model:Show()
    --         model:Undress()
    --         C_Timer.After(0.2, function()
    --             model:SetRotation(modelSetup.rotation);
    --             model:SetPosition(modelSetup.pos[1], modelSetup.pos[2], modelSetup.pos[3]);
    --             model:SetPortraitZoom(modelSetup.zoom);
    --             model:TryOn(string.format("item:%d", self.filteredItems[index].itemID))

    --             if self.filteredItems[index].isKnown == 1 then
    --                 model.Border:SetAtlas("transmog-wardrobe-border-collected")
    --             else
    --                 model.Border:SetAtlas("transmog-wardrobe-border-uncollected")
    --             end

    --             local alternatives = {}
    --             for k, v in ipairs(self.filteredItems[index].alternativeItems) do
    --                 if self.filteredItems[index].isKnown == 1 then
    --                     table.insert(alternatives, {
    --                         itemID = v.itemID,
    --                         collected = true,
    --                         itemLink = v.itemLink,
    --                     })
    --                 else
    --                     table.insert(alternatives, {
    --                         itemID = v.itemID,
    --                         collected = false,
    --                         itemLink = v.itemLink,
    --                     })
    --                 end
    --             end

    --             model.alternativeItems = alternatives
    --         end) 
    --     else
    --         model:Hide()
    --     end
    -- end
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:OnMouseWheel(delta)
	self.PagingFrame:OnMouseWheel(delta);
end



ClassicWrathCollectionsBuddy_WardrobeItemModelMixin = {}

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnLoad()
	self:SetAutoDress(false);
	self:SetUnit("player", false, true);
	self:FreezeAnimation(0, 0, 0);
	local x, y, z = self:TransformCameraSpaceToModelSpace(CreateVector3D(0, 0, -0.25)):GetXYZ();
	self:SetPosition(x, y, z);

	local lightValues = { omnidirectional = false, point = CreateVector3D(-1, 1, -1), ambientIntensity = 1, ambientColor = CreateColor(1, 1, 1), diffuseIntensity = 0, diffuseColor = CreateColor(1, 1, 1) };
	local enabled = true;
	self:SetLight(enabled, lightValues);

end

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnModelLoaded()
    self:SetRotation(0.0);
    self:SetPosition(0,0,0);
    self:FreezeAnimation(0, 0, 0);
    self:SetPortraitZoom(0);
end


function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnEnter()

    GameTooltip:ClearLines()

    if self.alternativeItems then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(self.alternativeItems[1].itemID)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Shared appearances")
        for k, v in ipairs(self.alternativeItems) do
            GameTooltip:AddLine(v.itemLink)
            -- if v.collected then
            --     -- local collectedString = string.format("%s %s", v.itemLink, CreateAtlasMarkup("transmog-icon-checkmark", 16, 16))
            --     -- GameTooltip:AddLine(collectedString)
            --     GameTooltip:AddDoubleLine(v.itemLink, CreateAtlasMarkup("services-checkmark", 16, 16))
            -- else
            --     GameTooltip:AddLine(v.itemLink)
            -- end
        end
        GameTooltip:Show()
    end
end

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnLeave()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
end

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnUpdate()

end

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:CWC_OnTransmogAppearanceAdded(itemID)

end

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnShow()

end