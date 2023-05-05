-- the Utils obj it's just a way for me to seperate the utility functions
-- in this API we'll need the GUID if we want to use its functions
UTILS = 'db716c'

-- ! OBJECTS PLACEMENT

-- white
white_placement = {
    card_zone = {
        island_resources = {10.80, 3, -37.00},
        brown_resources = {13.50, 3, -37.00},
        grey_resources = {16.20, 3, -37.00},
        commerce = {18.90, 3, -37.00},
        blue = {21.60, 3, -37.00},
        war_conflict = {24.30, 3, -37.00},
        naval_conflict = {27.00, 3, -37.00},
        compass = {29.70, 3, -37.00},
        tablet = {32.40, 3, -37.00},
        gear = {35.10, 3, -37.00},
        green_island = {37.80, 3, -37.00},
        purple = {40.50, 3, -37.00},
        black = {43.20, 3, -37.00}
    },

    leader_zone = {
        leader_deck = {13.50, 2, -63.30},
        first_leader = {13.50, 2, -63.30},
        offset_z = -1
    },

    wonder_zone = {
        wonder = {27.00, 2, -64.00},
        buried_leader = {22.00, 1.46, -64.00},
        first_step = {23.70, 1.45, -66.50},
        second_step = {27.00, 1.45, -66.50},
        third_step = {30.30, 1.45, -66.50},
        fourth_step = {0, 0, 0}
    },

    stockyard_zone = {
        stockyard = {35.00, 2, -63.00},
        first_group_island = {42.00, 2, -62.00},
        second_group_island = {42.00, 2, -65.00},
        offset_x = -1
    },

    project_zone = {
        first_project = {14.85, 2, -31.50},
        second_project = {27, 2, -31.50},
        third_project = {39.15, 2, -31.50}
    }
}

-- ! CARDS AND TOKENS GUID

-- base game
BASE_DECK_GUID = {
    ['age1'] = {'501ae8', '9b51a7', '6123d4', 'bf52e6', 'a5a6ee'},
    ['age2'] = {'8e40b9', '1a8f31', 'e96ff5', '912d26', '453cee'},
    ['age3'] = {'88f04b', '92c03a', 'b0035e', 'c2a4ea', '864847'}
}

GUILD_DECK_GUID = 'a5b1c7'