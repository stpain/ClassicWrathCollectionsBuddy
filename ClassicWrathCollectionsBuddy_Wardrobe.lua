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

--look up table to set the mog slotID
local outfitInvSlots = {
["INVTYPE_HEAD"] = 1,
["INVTYPE_SHOULDER"] = 3,
["INVTYPE_BODY"] = 4,
["INVTYPE_CHEST"] = 5,
["INVTYPE_ROBE"] = 5,
["INVTYPE_WAIST"] = 6,
["INVTYPE_LEGS"] = 7,
["INVTYPE_FEET"] = 8,
["INVTYPE_WRIST"] = 9,
["INVTYPE_HAND"] = 10,
["INVTYPE_CLOAK"] = 15,
["INVTYPE_MAINHAND"] = 16,
["INVTYPE_OFFHAND"] = 17,
["INVTYPE_RANGED"] = 16,
["INVTYPE_RANGEDRIGHT"] = 16,
["INVTYPE_TABARD"] = 19,
["INVTYPE_WEAPON"] = 16,
["INVTYPE_2HWEAPON"] = 16,
["INVTYPE_WEAPONMAINHAND"] = 16,
["INVTYPE_WEAPONOFFHAND"] = 17,
["INVTYPE_SHIELD"] = 17,
["INVTYPE_HOLDABLE"] = 17,
}

--used to determine the model position
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
    [17] = "INVTYPE_WEAPONOFFHAND",
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

local popoutWardrobeNineSlice =
{
    TopLeftCorner =	{ atlas = "UI-Frame-DiamondMetal-CornerTopLeft", },
    TopRightCorner =	{ atlas = "UI-Frame-DiamondMetal-CornerTopRight", },
    BottomLeftCorner =	{ atlas = "UI-Frame-DiamondMetal-CornerBottomLeft", },
    BottomRightCorner =	{ atlas = "UI-Frame-DiamondMetal-CornerBottomRight", },
    TopEdge = { atlas = "_UI-Frame-DiamondMetal-EdgeTop", },
    BottomEdge = { atlas = "_UI-Frame-DiamondMetal-EdgeBottom", },
    LeftEdge = { atlas = "!UI-Frame-DiamondMetal-EdgeLeft", },
    RightEdge = { atlas = "!UI-Frame-DiamondMetal-EdgeRight", },
    --Center = { layer = "BACKGROUND", atlas = "ClassHall_InfoBoxMission-BackgroundTile", x = -20, y = 20, x1 = 20, y1 = -20 },
}





StaticPopupDialogs['ClassicWrathCollectionsBuddy_NewOutfitPopup'] = {
    text = "New outfit name.",
    button1 = YES,
    button2 = NO,
    OnAccept = function(self, data)
        if data.name then
            local str = self.editBox:GetText()
            if str and (#str > 0) and (str ~= " ") then
                Database:CreateOutfit(data.name, str)
            end
        end
    end,
    OnCancel = function(self)

    end,
    timeout = 0,
    hasEditBox = true,
    whileDead = true,
    hideOnEscape = false,
    preferredIndex = 3,
    showAlert = 1,
}






--wip
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

    self.navButtons = {}

	local slots = { "head", "shoulder", "cloak", "chest", "robe", "tabard", "wrist", "hand", "waist", "legs", "feet", defaultSectionSpacing, "mainhand", "offhand", "shield" };
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

            --adjust atlas as the table was modified to INV_* name
            if slotString == "shield" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-secondaryhand", true);
            elseif slotString == "hand" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-hands", true);
            elseif slotString == "cloak" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-back", true);
            elseif slotString == "secondaryhand" then
                button.NormalTexture:SetAtlas("transmog-nav-slot-mainhand", true);
            elseif slotString == "offhand" then
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

                for k, but in ipairs(self.navButtons) do
                    but.SelectedTexture:Hide()
                end
                button.SelectedTexture:Show()


                --weaponSlot 1=main, 2=off, 3=held

                --main hand weapons, set the weaponSlot for model try on
                if button.equipLocation == "INVTYPE_MAINHAND" then
                    UIDropDownMenu_Initialize(self.WeaponDropDown, function(CwcWardrobeFrameWeaponDropDown)
                        for i = 0, 20 do
                            if i ~= 11 and i ~= 12 and i ~= 9 and i ~= 17 and i ~= 14 then
                                local info = UIDropDownMenu_CreateInfo()
                                local name, isArmorType = GetItemSubClassInfo(2, i)
                                info.text = name
                                info.func = function()
                                    self.weaponSlot = 1
                                    UIDropDownMenu_SetText(self.WeaponDropDown, name)
                                    self:LoadWeapons(i)
                                end
                                UIDropDownMenu_AddButton(info)
                            end
                        end
                    end)
                    self.WeaponDropDown:Show()


                elseif button.equipLocation == "INVTYPE_OFFHAND" then
                    UIDropDownMenu_Initialize(self.WeaponDropDown, function(CwcWardrobeFrameWeaponDropDown)
                        local info = UIDropDownMenu_CreateInfo()
                        -- local name, isArmorType = GetItemSubClassInfo(4, 0)
                        info.text = INVTYPE_HOLDABLE
                        info.func = function()
                            self.weaponSlot = 3
                            self.selectedInvType = "INVTYPE_WEAPONOFFHAND"
                            UIDropDownMenu_SetText(self.WeaponDropDown, INVTYPE_HOLDABLE)
                            self:LoadWeapons(0)
                        end
                        UIDropDownMenu_AddButton(info)
                        for i = 0, 20 do
                            if i == 0 or i == 4 or i == 7 or i == 13 or i == 15 then
                                local info = UIDropDownMenu_CreateInfo()
                                local name, isArmorType = GetItemSubClassInfo(2, i)
                                info.text = name
                                info.func = function()
                                    self.weaponSlot = 2
                                    UIDropDownMenu_SetText(self.WeaponDropDown, name)
                                    self:LoadWeapons(i)
                                end
                                UIDropDownMenu_AddButton(info)
                            end
                        end
                    end)
                    self.WeaponDropDown:Show()



                else

                    --non weapons use different logic
                    --self.selectedInvType is used to position the model
                    if addon.transmogItemData and addon.transmogItemData[button.equipLocation] then
                        self.weaponSlot = 0
                        self.selectedInvType = button.equipLocation
                        self:LoadItems(addon.transmogItemData[button.equipLocation])
                        self.WeaponDropDown:Hide()
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

            table.insert(self.navButtons, button)
		end
	end
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:RefreshOutfitDropdown()
    UIDropDownMenu_SetWidth(self.DressUp.OutfitDropDown, 100)
    UIDropDownMenu_Initialize(self.DressUp.OutfitDropDown, function(CwcWardrobeFrameDressUpOutfitDropDown)

        for k, v in ipairs(Database.db.outfits) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = v.name
            info.notCheckable = true
            info.func = function()
                UIDropDownMenu_SetText(self.DressUp.OutfitDropDown, v.name);
                self.DressUp.Model.selectedOutfit = v;
                self.DressUp.Model.selectedOutfitIndex = k;
                for k, itemID in pairs(v.items) do
                    self.DressUp.Model:TryOn("item:"..itemID)
                end
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:Database_OnProfileSelected(profile)
    self.characterProfile = profile;
    self:RefreshOutfitDropdown()
    self.DressUp.Background:SetAtlas(string.format("transmog-background-race-%s", self.characterProfile.raceName));
end

function ClassicWrathCollectionsBuddy_WardrobeMixin:Database_OnOutfitDeleted()
    self:RefreshOutfitDropdown()
end

function ClassicWrathCollectionsBuddy_WardrobeMixin:Database_OnOutfitCreated(index, outfit)
    self.DressUp.Model.selectedOutfit = outfit;
    self.DressUp.Model.selectedOutfitIndex = index;
    for k, itemID in pairs(outfit.items) do
        self.DressUp.Model:TryOn("item:"..itemID)
    end

    self:RefreshOutfitDropdown()

end

function ClassicWrathCollectionsBuddy_WardrobeMixin:CWC_OnWardrobeItemClicked(itemInfo, weaponSlot)
    if itemInfo.itemID then
        self.DressUp.Model:TryOn("item:"..itemInfo.itemID, weaponSlot)

        if self.DressUp.Model.selectedOutfit then
            self.DressUp.Model.selectedOutfit.items[itemInfo.equipLocation] = itemInfo.itemID
        end
    end
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:CreateTransmoghyperlink(outfit)
    if outfit and outfit.items then
        local link = "|cffff80ff|Haddon:"
        for k, v in pairs(outfit.items) do

        end
    end
end


function ClassicWrathCollectionsBuddy_WardrobeMixin:CWC_OnTransmogAppearanceAdded()

end

function ClassicWrathCollectionsBuddy_WardrobeMixin:OnLoad()

    addon:RegisterCallback("Database_OnProfileSelected", self.Database_OnProfileSelected, self)
    addon:RegisterCallback("CWC_OnTransmogAppearanceAdded", self.CWC_OnTransmogAppearanceAdded, self)
    addon:RegisterCallback("Database_OnOutfitCreated", self.Database_OnOutfitCreated, self)
    addon:RegisterCallback("Database_OnOutfitDeleted", self.Database_OnOutfitDeleted, self)
    addon:RegisterCallback("CWC_OnWardrobeItemClicked", self.CWC_OnWardrobeItemClicked, self)

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
    self.weaponSlot = 0;

    UIDropDownMenu_SetWidth(self.WeaponDropDown, 140)

    self.DressUp.New:SetScript("OnClick", function()
        if self.characterProfile then
            StaticPopup_Show("ClassicWrathCollectionsBuddy_NewOutfitPopup", nil, nil, self.characterProfile)
        end
    end)
    self.DressUp.Delete:SetScript("OnClick", function()
        if self.DressUp.Model.selectedOutfit and self.DressUp.Model.selectedOutfitIndex then
            Database:DeleteOutfit(self.DressUp.Model.selectedOutfitIndex)
        end
    end)

    self.DressUp.Model.items = {}
    self.DressUp.Model:SetUnit("player")
    self.DressUp.Model:FreezeAnimation(0, 0, 0);
	local x, y, z = self.DressUp.Model:TransformCameraSpaceToModelSpace(CreateVector3D(0, 0, -0.25)):GetXYZ();
	self.DressUp.Model:SetPosition(x, y, z);

    --popoutWardrobeNineSlice
    NineSliceUtil.ApplyLayout(self.DressUp, popoutWardrobeNineSlice)

    self.DressUp.Model:SetScript("OnMouseDown", function(model, button)
        if button == "LeftButton" then
            model.rotating = true
            model.rotateStartCursorX = GetCursorPosition()
        end
    end)

    self.DressUp.Model:SetScript("OnMouseUp", function(model, button)
        if button == "LeftButton" then
            model.rotating = false
        end
    end)

    self.DressUp.Model:SetScript("OnUpdate", function(model)
    	if ( model.rotating ) then
            local x = GetCursorPosition();
            local diff = (x - model.rotateStartCursorX) * 0.05-- MODELFRAME_DRAG_ROTATION_CONSTANT;
            model.rotateStartCursorX = GetCursorPosition();
            model.yaw = (model.yaw or 1) + diff;
            if ( model.yaw < 0 ) then
                model.yaw = model.yaw + (2 * PI);
            end
            if ( model.yaw > (2 * PI) ) then
                model.yaw = model.yaw - (2 * PI);
            end
            model:SetRotation(model.yaw, false);


        -- elseif ( model.panning ) then
        --     local cursorX, cursorY = GetCursorPosition();
        --     local modelX = model:GetPosition();
        --     local panSpeedModifier = 100 * sqrt(1 + modelX - model.defaultPosX);
        --     local modelY = model.panStartModelY + (cursorX - model.panStartCursorX) / panSpeedModifier;
        --     local modelZ = model.panStartModelZ + (cursorY - model.panStartCursorY) / panSpeedModifier;
        --     local limits = model:GetPanAndZoomLimits();
        --     modelY = Clamp(modelY, limits.panMaxLeft, limits.panMaxRight);
        --     modelZ = Clamp(modelZ, limits.panMaxBottom, limits.panMaxTop);
        --     model:SetPosition(modelX, modelY, modelZ);
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
    --                         local itemName = item:GetItemName()
    --                         if itemName:find("Monster -") then


    --                         else
    --                             table.insert(ClassicWrathCollectionsBuddy_Character[itemEquipLoc][info[4]], {
    --                                 classID = classID,
    --                                 subClassID = subclassID,
    --                                 itemID = info[2],
    --                                 itemLink = item:GetItemLink(),
    --                                 sourceID = info[6]
    --                             })
    
    --                         end
    --                     end)
    --                 end
    --             end

    --         end

    --         print(string.format("processed %d of %d", index, numToProcess))

    --         index = index + 1;
    
    --     self.items = ClassicWrathCollectionsBuddy_Character
    -- end, numToProcess)

end


function ClassicWrathCollectionsBuddy_WardrobeMixin:LoadWeapons(subClassID)

    self.loadWeaponSubClassID = subClassID;
    self.items = nil

    self.filteredItems = {}
    local weapons;
    local equipLoc =16
    if self.weaponSlot == 1 then
        weapons = {"INVTYPE_WEAPONMAINHAND", "INVTYPE_WEAPON", "INVTYPE_2HWEAPON", "INVTYPE_WEAPONOFFHAND", "INVTYPE_RANGEDRIGHT", "INVTYPE_RANGED"}
    elseif self.weaponSlot == 2 then
        weapons = {"INVTYPE_WEAPON", "INVTYPE_WEAPONOFFHAND"}
        equipLoc = 17
    elseif self.weaponSlot == 3 then
        weapons = {"INVTYPE_HOLDABLE"}
        equipLoc = 17
    end


    for k, v in ipairs(weapons) do
        for appearanceID, mogs in pairs(addon.transmogItemData[v]) do

            if mogs and #mogs > 0 then

                local isKnown = 0
                local sharedItems = Database:GetItemIDsForAppearanceID(v, appearanceID)
                for k, itemID in ipairs(sharedItems) do
                    isKnown = Database:IsItemKnown(itemID)
                    if isKnown == 1 then
                        break
                    end
                end
        
                if (mogs[1].classID == 2 or (mogs[1].classID == 4)) and (mogs[1].subClassID == subClassID) then
                    table.insert(self.filteredItems, {
                        itemID = mogs[1].itemID,
                        appearanceID = appearanceID,
                        alternativeItems = mogs,
                        isKnown = isKnown,
                        equipLocation = equipLoc
                    })

                end
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

    if self.weaponSlot == 1 then
        self.selectedInvType = equipLocationWeapons[subClassID]
    else
        self.selectedInvType = "INVTYPE_WEAPONOFFHAND"
    end

    self:OnPageChanged()
end
function ClassicWrathCollectionsBuddy_WardrobeMixin:LoadItems(items)

    self.items = items
    self.loadWeaponSubClassID = nil

    self.filteredItems = {}

    local itemClassID;
    local itemSubClassID;

    if self.selectedInvType == "INVTYPE_SHIELD" then
        itemClassID = 4
        itemSubClassID = { [1] = 0, [2] = 6, }

    elseif self.selectedInvType == "INVTYPE_TABARD" then
        itemClassID = 4
        itemSubClassID = 0

    elseif self.selectedInvType == "INVTYPE_CLOAK" then
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

        for appearanceID, mogs in pairs(items) do

            if mogs and #mogs > 0 then

                local isKnown = 0
                local sharedItems = Database:GetItemIDsForAppearanceID(self.selectedInvType, appearanceID)
                for k, itemID in ipairs(sharedItems) do
                    isKnown = Database:IsItemKnown(itemID)
                    if isKnown == 1 then
                        break
                    end
                end

                if type(itemSubClassID) ==  "table" then

                    for k, v in ipairs(itemSubClassID) do
                        if (mogs[1].classID == itemClassID) and (mogs[1].subClassID == v) then
                            table.insert(self.filteredItems, {
                                itemID = mogs[1].itemID,
                                appearanceID = appearanceID,
                                alternativeItems = mogs,
                                isKnown = isKnown,
                                equipLocation = outfitInvSlots[self.selectedInvType],
                            })
                        end
                    end
                else
                    if (mogs[1].classID == itemClassID) and (mogs[1].subClassID == itemSubClassID) then
                        table.insert(self.filteredItems, {
                            itemID = mogs[1].itemID,
                            appearanceID = appearanceID,
                            alternativeItems = mogs,
                            isKnown = isKnown,
                            equipLocation = outfitInvSlots[self.selectedInvType],
                        })
                    end
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
        model.itemInfo = nil
        local index = i + (self.PagingFrame:GetCurrentPage() - 1) * self.PAGE_SIZE

        if self.filteredItems[index] and modelRaceOffsets[self.characterProfile.raceName][self.selectedInvType] then

            local modelSetup = modelRaceOffsets[self.characterProfile.raceName][self.selectedInvType]
            model:Show()
            model:Undress()
            model:SetRotation(modelSetup.rotation);
            model:SetPosition(modelSetup.pos[1], modelSetup.pos[2], modelSetup.pos[3]);
            model:SetPortraitZoom(modelSetup.zoom);

            if (self.weaponSlot == 1) then
                model:TryOn(string.format("item:%d", self.filteredItems[index].itemID), "MAINHANDSLOT")
                model.weaponSlot = "MAINHANDSLOT"
            else
                model:TryOn(string.format("item:%d", self.filteredItems[index].itemID), "SECONDARYHANDSLOT")
                model.weaponSlot = "SECONDARYHANDSLOT"
            end

            model.itemInfo =self.filteredItems[index]

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
        else
            model:Hide()
        end
        i = i + 1
    end, self.PAGE_SIZE)

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

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnMouseDown(button)

    if self.itemInfo then
        addon:TriggerEvent("CWC_OnWardrobeItemClicked", self.itemInfo, self.weaponSlot)
    end
end

function ClassicWrathCollectionsBuddy_WardrobeItemModelMixin:OnShow()

end