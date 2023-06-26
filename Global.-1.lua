-- ! SCRIPTS GUID
-- i always love to seprate my script in more script to get a cleaer result
-- and in lua tts this is a bit weird because you can't just create a file.lua and that's it 
-- you have to create an in-game object and call its fuction using his guid
STATUS_PANEL_GUID = '80fac4'
STATUS_PANEL = nil

-- i dont remeber this
TABLE_HEIGHT = 1.41

-- ! OBJECT PLACEMENTS
PLAYERS = {
    white = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },
        }
    },

    purple = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },
        }
    },

    red = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },
        }
    },

    yellow = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },
        }
    },

    green = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },
        }
    },

    orange = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },
        }
    },

    blue = {
        card_to_play = {
            card_pos = nil,
            card_rot = nil
        },
        objects = {
            wonder = {
                wonder_obj = nil,
                wonder_pos = nil,
                wonder_rot = nil
            },
        },
        stacks = {
            non_buyable_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            brown_res_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            grey_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            commerce_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            blue_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            war_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            naval_conflict_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            compass_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            tablet_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            gear_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            green_island_stack = {
                guid_zone = '',
                origin =nil,

                cards = {}
            },

            purple_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            },

            black_stack = {
                guid_zone = '',
                origin = nil,

                cards = {}
            }
        }
    }
}

OBJECTS_OFFSETS = {
    ["stacks"] = {
        ["non_buyable_res_stack"] = -16.2,
        ["brown_res_stack"] = -13.50,
        ["grey_stack"] = -10.80,
        ["commerce_stack"] = -8.10,
        ["blue_stack"] = -5.40,
        ["war_conflict_stack"] = -2.70,
        ["naval_conflict_stack"] = 0,
        ["compass_stack"] = 2.70,
        ["tablet_stack"] = 5.40,
        ["gear_stack"] = 8.10,
        ["green_island_stack"] = 10.80,
        ["purple_stack"] = 13.50,
        ["black_stack"] = 16.2,

        ["z"] = 41
    },

    ["card_to_play"] = 48,

    ["wonder"] = 14,

    ["coins"] = {
        ["x"] = 5,
        ["z"] = 17.5,
        ["padding"] = -0.80
    }
}

-- ! CARDS AND TOKENS GUID

-- base game
BASE_DECK_GUID = {
    ["age1"] = {'501ae8', '9b51a7', '6123d4', 'bf52e6', 'a5a6ee'},
    ["age2"] = {'8e40b9', '1a8f31', 'e96ff5', '912d26', '453cee'},
    ["age3"] = {'88f04b', '92c03a', 'b0035e', 'c2a4ea', '864847'}
}

GUILD_DECK_GUID = 'a5b1c7'

WONDERS_BAGS = {
    ["base"] = '56d45b',
    ["leaders"] = '053343',
    ["cities"] = 'a49969',
    ["armada"] = 'e1435d',
    ["edifice"] = 'd9d9c0'
}

COINS_BAGS = {
    ["silver"] = '3f95a5',      -- 1 gold coins
    ["gold"] =  '3cad45',       -- 3 gold coins
    ["bronze"] = '9e60c9'       -- 6 gold coins 
}

-- ! ONLOAD()
function onLoad(saved_data)

    -- ! GLOBAL VARIABLES INIT
    STATUS_PANEL = getObjectFromGUID(STATUS_PANEL_GUID)
    Global.setVar('STATUS_PANEL', STATUS_PANEL)

    -- ! SETTING SNAP POINTS

    -- ! FUNCTIONS
    calulcateOrigins()
    generateSnapPoints()
    STATUS_PANEL.call('populateStatusPanel')

end

function onPlayerChangeColor(player_color)
    generateSnapPoints()
    STATUS_PANEL.call('populateStatusPanel')
end

-- one important feature of this mod is the auto placement of cards
-- every single column in a player's board is made for specific kind of cards (not colors)
-- so to make things easier we calculate every origin(x, y, z) for each stack
function calulcateOrigins()
    -- instaed of editing every value of PLAYERS we'll just use a temp table
    local new_stack = Global.getTable('PLAYERS')

    for _, color in pairs(getSeatedPlayers()) do

        -- for every player we calculate these origins based on its hand transform (position, rotation etc. etc.)
        local origin = Player[color].getHandTransform(1)

        -- a table of offsets for each kind of cards
        local stack_offsets = Global.getTable('OBJECTS_OFFSETS')['stacks']

        -- for every kind of stack we then calculate the origin using our offsets
        for stack_name, _ in pairs(new_stack[string.lower(color)]['stacks']) do

            -- the origin we are going to calculate
            local stack_origin = Vector(0, 0, 0)
            stack_origin[1] = origin.position[1] + origin.forward[1] * stack_offsets['z'] + origin.right[1] * stack_offsets[stack_name]
            stack_origin[2] = TABLE_HEIGHT
            stack_origin[3] = origin.position[3] + origin.forward[3] * stack_offsets['z'] + origin.right[3] * stack_offsets[stack_name]

            -- in the end we update the origin in our temp table
            new_stack[string.lower(color)]['stacks'][stack_name]['origin'] = stack_origin
        end

    end

    -- lastly we commit the changes to the original table
    Global.setTable('PLAYERS', new_stack)
end

-- this function will generate the snap points in front of every player
function generateSnapPoints()
    local snap_points_table = {}
    local new_players = Global.getTable("PLAYERS")

    for _, color in pairs(getSeatedPlayers()) do
        -- init of the position and roation of the snap point
        local snap_point_pos = Vector(0, 0, 0)
        local snap_point_rot = Vector(0, 0, 0)

        -- we always set the player's hand as our origin
        local origin = Player[color].getHandTransform()
        local offset = self.getTable("OBJECTS_OFFSETS")["card_to_play"]

        -- calculating the position of the snap points
        snap_point_pos[1] = origin.position[1] + (origin.forward[1] * offset)
        snap_point_pos[2] = TABLE_HEIGHT
        snap_point_pos[3] = origin.position[3] + (origin.forward[3] * offset)

        -- calculating the rotaton of the snap points
        snap_point_rot[1] = origin.rotation[1]
        snap_point_rot[2] = origin.rotation[2] + 180
        snap_point_rot[3] = origin.rotation[3]

        -- appending each snap point just made
        table.insert(snap_points_table, {
            position = snap_point_pos,
            rotation = snap_point_rot,
            rotation_snap = true,
            tags = {"Card"}
        })

        -- once we made this snap point we'll use its position and rotation for the menu of each player
        local menu_pos = Vector(snap_point_pos)
        local menu_rot = Vector(snap_point_rot)

        -- editing so the cube to which is attached the panel is lined up underneath the snap point
        menu_pos[2] = TABLE_HEIGHT - 0.50
        menu_rot[2] = menu_rot[2] + 180

        -- saving the vectors inside our main players table
        new_players[string.lower(color)]["card_to_play"]["card_pos"] = menu_pos
        new_players[string.lower(color)]["card_to_play"]["card_rot"] = menu_rot
    end

    -- setting them all at once
    self.setSnapPoints(snap_points_table)
    Global.setTable("PLAYERS", new_players)
end

-- this function helps us regolate the order of seats
-- since calling getSeatedPlayers() doesn't give us the players in the right oder
function getPlayersSorted()
    local players = {}

    -- the turn type should always be custom (type = 2) and it should alwyas be in the correct order
    -- but just in case we set our defined order
    if Turns.type == 1 then
        Turns.type = 2
        Turns.order = {'White', 'Purple', 'Red', 'Yellow', 'Green', 'Orange', 'Blue'}
    end

    -- following the order just set we append the matching colors 
    for _, color in pairs(Turns.order) do
        if Player[color].seated then
            players[#players + 1] = color
        end
    end

    return players
end

function onChat(msg)
    if msg == "pos and rot" then
        print(PLAYERS["blue"]["card_to_play"]["card_pos"])
        print(PLAYERS["blue"]["card_to_play"]["card_rot"])
    end
end